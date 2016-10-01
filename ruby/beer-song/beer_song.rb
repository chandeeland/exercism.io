class BeerSong

  attr_reader :current_bottle

  def verses(start, stop = nil)
    stop = start if stop.nil?
    (stop..start).to_a.reverse.map do |x|
      verse(x)
    end.join("\n")
  end

  def verse(n)
    self.class.verse_factory(n).verse
  end

  def lyrics
    verses(99, 0)
  end

  def self.verse_factory(n)
    case n
    when 0
      return VerseZero.new(n)
    when 1
      return VerseOne.new(n)
    when 99
      return Verse99.new(n)
    else
      return VerseX.new(n)
    end
  end

  class VerseX
    def initialize(n)
      @num = n
      @oneit = 'one'
      @bottles = 'bottles'
      @next_verse = n - 1
    end

    attr_reader :num, :oneit, :bottles, :next_verse

    def verse
      first_line + BeerSong
        .verse_factory(next_verse).second_line
    end

    def first_line
      "#{the_wall}, #{num_beers.downcase}.\n"
    end

    def  second_line
      "#{action}, #{the_wall.downcase}.\n"
    end

    def action
      "Take #{oneit} down and pass it around"
    end

    def num_beers
      "#{num} #{bottles} of beer"
    end

    def the_wall
      "#{num_beers} on the wall"
    end
  end

  class Verse99 < VerseX
    def action
      "Go to the store and buy some more"
    end
  end

  class VerseOne < VerseX
    def initialize(n = 1)
      super(n)
      @bottles = 'bottle'
    end
  end

  class VerseZero < VerseX
    def initialize(n = 0)
      super(n)
      @next_verse = 99
      @oneit = 'it'
    end

    def num_beers
      "No more #{bottles} of beer"
    end

  end


end

module BookKeeping
  VERSION = 2
end
