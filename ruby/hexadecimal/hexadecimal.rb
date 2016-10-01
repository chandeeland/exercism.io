class Hexadecimal
  VALUES = {
    '0' => 0, '1' => 1, '2' => 2, '3' => 3,
    '4' => 4, '5' => 5, '6' => 6, '7' => 7,
    '8' => 8, '9' => 9, 'a' => 10, 'b' => 11,
    'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
  }
  def initialize(hex)
    @hex = hex.downcase =~ /[^#{VALUES.keys}]/ ? 0.to_s : hex.downcase
  end

  attr_reader :hex

  def to_decimal
    hex.split('').reverse
      .map.with_index { |x, i|
        VALUES[x.to_s].to_i * (16 ** i)
      }.reduce(:+)
  end

end
