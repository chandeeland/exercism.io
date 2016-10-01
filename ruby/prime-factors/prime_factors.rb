class PrimeFactors
  def self.for(num)
    curr = 2
    [].tap do |factors|
      while num > 1
        if num % curr == 0
          num = num / curr
          factors << curr
        else
          curr +=1
        end
      end
    end
  end
end
