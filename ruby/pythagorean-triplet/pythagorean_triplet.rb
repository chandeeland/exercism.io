class Triplet

  attr_reader :triplet, :a, :b, :c

  def initialize(a, b, c)
    @triplet = [a, b, c]
    @a = a
    @b = b
    @c = c
  end

  def self.where(min_factor: 1, max_factor: 10, sum: nil)
    trips = (min_factor..max_factor).to_a
      .combination(3)
      .map { |trip| new(*trip) }
      .select(&:pythagorean?)
    return trips.select{|x| x.sum == sum} unless sum.nil?
    trips
  end

  def sum
    triplet.reduce(:+)
  end

  def product
    triplet.reduce(:*)
  end

  def pythagorean?
    a ** 2 + b ** 2 == c ** 2
  end
end
