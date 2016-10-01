class Squares

  def initialize(n)
    @n = n
  end

  attr_reader :n

  def square_of_sum
    (0..n).inject(:+)**2
  end

  def sum_of_squares
    (0..n).inject{ |sum, x| sum += x**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION=3
end
