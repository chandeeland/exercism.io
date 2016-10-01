class Luhn
  attr_reader :digits

  def initialize(num)
    @digits = num.to_s.chars.map(&:to_i)
  end

  def addends
    ends(digits)
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    luhn = new(num * 10)
    delta = (10 - luhn.checksum % 10) % 10

    num * 10 + delta
  end

  private

  def ends(num)
    num.reverse.map.with_index do |digit, i|
      if i % 2 == 0
        digit
      elsif digit > 4
        digit * 2 - 9
      else
        digit * 2
      end
    end.reverse
  end

end
