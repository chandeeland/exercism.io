class Allergies

  ALLERGENS = {
    eggs: 1,
    peanuts: 2,
    shellfish: 4,
    strawberries: 8,
    tomatoes: 16,
    chocolate: 32,
    pollen: 64,
    cats: 128
  }

  attr_reader :score

  def initialize(score)
    @score = score
  end

  def allergic_to?(x)
    target = ALLERGENS[x.to_sym]
    (score & target) == target
  end

  def list
    ALLERGENS.keys.select{|x| allergic_to?(x)}.map(&:to_s)
  end

end
