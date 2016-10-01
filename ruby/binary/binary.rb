class Binary
  def initialize(b)
    raise ArgumentError if b =~ /[^01]/
    @digits = b.split('').map(&:to_i).reverse
  end

  attr_reader :digits
  def to_decimal
    dec = 0
    @digits.each.with_index do |d, i|
      dec += d * 2 ** i
    end
    dec
  end

end

module BookKeeping
  VERSION = 2
end
