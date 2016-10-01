module BookKeeping
  VERSION=1
end

class Poker
  class Card

    VALUES = (((2..10).map(&:to_s) + %w(J Q K A)).zip((2..14).to_a)).to_h

    attr_reader :card

    def initialize(card)
      @card = card
    end

    def value
      VALUES[card.chars.first.to_s]
    end

    def suit
      card.chars.last
    end

  end

  class Hand
    attr_reader :cards
    def initialize(hand)
      @cards = {}.tap do |out|
        hand.each do |card|
          c = Card.new(card)
          out[c.value] ||= []
          out[c.value] << c
        end
      end
    end

    def value
      return 15000 + high_card if flush? && straight?
      return 2000 + trips if full_house?
      return 1520 + high_card if flush?
      return 1500 + high_card if straight?
      high_card + pairs + trips + quads
    end

    private

    def high_card
      cards.keys.max
    end

    def matches(n)
      cards.select { |k, v| v.count == n }
        .map { |k, v| k * (10 **( n - 1 ))}
        .reduce(:+)
        .to_i
    end

    def pairs
      matches(2)
    end

    def trips
      matches(3)
    end

    def quads
      matches(4)
    end

    def straight?
      ace_straight? || (cards.count == 5 && (cards.keys.max - cards.keys.min == 4))
    end

    def ace_straight?
      cards.count == 5 && (cards.keys.sort == [2, 3, 4, 5, 14])
    end

    def flush?
      cards.values.flatten.map(&:suit).uniq.count == 1
    end

    def full_house?
      pairs > 0 && trips > 0
    end
  end

  attr_reader :hands

  def initialize(hands)
    @hands = {}.tap do |out|
      hands.each do |hand|
        h = Hand.new(hand)
        out[h.value] ||= []
        out[h.value] << hand
      end
    end
  end

  def best_hand
    hands[hands.keys.max]
  end

end
