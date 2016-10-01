module BookKeeping
  VERSION = 1
end

class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 2
    sum = self.factors(number).reduce(:+)
    if sum > number
      'abundant'
    elsif sum == number
      'perfect'
    else
      'deficient'
    end
  end

  def self.factors(number)
    curr = 2
    [1].tap do |factors|
      while (curr * curr <= number) do
        if number % curr == 0
          factors << curr
          factors << number / curr
        end
        curr += 1
      end
    end
  end
end
