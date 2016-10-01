class Sieve
  def initialize(n)
    @n = n
  end

  attr_accessor :n

  def primes
    numbers = (2..n).to_a
    [].tap do |primes|
      while (numbers.count > 0)
        primes.push(numbers.shift)
        numbers = numbers.select{|n| n % primes.last > 0}
      end
    end
  end

end
