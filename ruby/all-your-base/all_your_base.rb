module BookKeeping
  VERSION = 1
end

class BaseConverter
  def self.convert(input_base, digits, output_base)
    return nil if input_base < 2 || output_base < 2
    return nil if digits.any? { |d| d >= input_base || d < 0 }
    self.to_base(output_base, self.to_dec(input_base, digits))
  end

  def self.to_dec(base, digits)
    digits.reverse.map.with_index do |digit, i|
      digit.to_i * base ** i
    end.reduce(:+)
  end

  def self.to_base(base, dec)
    return [dec].compact if dec.nil? || dec < base
    (0..self.power(base, dec)).to_a.reverse.map do |i|
      digit = dec / base ** i
      dec -= (base ** i * digit)
      digit
    end
  end

  def self.power(base, dec)
    power = 1
    while base ** (power + 1) <= dec
      power += 1
    end
    power
  end
end
