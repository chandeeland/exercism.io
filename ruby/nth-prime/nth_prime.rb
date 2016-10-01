class Prime
  @@primes = [2,3]

  def self.nth(n)
    raise ArgumentError if n == 0
    return @@primes[n-1] if @@primes.count > n
    curr = @@primes.last + 2
    begin
      @@primes << curr if self.check_prime(curr)
      curr +=2
    end while @@primes.count < n
    @@primes[n-1]
  end

  def self.check_prime(curr)
    @@primes.each do |p|
      return false if curr % p == 0
    end
    return true
  end

end
