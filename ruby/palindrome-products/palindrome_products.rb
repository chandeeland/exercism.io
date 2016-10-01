class Palindromes
  def initialize(max_factor: 100, min_factor: 1)
    @min_factor = min_factor
    @max_factor = max_factor
  end

  attr_reader :max_factor, :min_factor

  def largest
    Palindrome.new(
      palindromes.last,
      palindrome_factors[palindromes.last]
    )
  end

  def smallest
    Palindrome.new(
      palindromes.first,
      palindrome_factors[palindromes.first]
    )
  end

  def generate

  end

  private

  def palindromes
    @palindromes ||= palindrome_factors.keys.sort
  end

  def factors
    (min_factor..max_factor).to_a.combination(2).to_a +
    (min_factor..max_factor).map{|x| [x,x]}
  end

  def palindrome_factors
    @palindrome_factors ||= {}.tap do |out|
      factors
        .select { |x|
          num = x.inject(:*)
          num.to_s == num.to_s.reverse
        }
        .each { |x|
          sum = x.inject(:*)
          out[sum] = [] unless out.key? sum
          out[sum] << x
        }
    end
  end


  class Palindrome
    def initialize(value, factors)
      @value = value
      @factors = factors
    end

    attr_reader :value, :factors
  end
end
