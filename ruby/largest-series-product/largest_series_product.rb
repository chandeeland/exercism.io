module BookKeeping
  VERSION = 2
end

class Series

  attr_reader :digits

  def initialize(msg)
    raise ArgumentError if msg =~ /[^\d]/
    @digits = msg.chars.map(&:to_i)
  end

  def largest_product(size)
    return 1 if size == 0
    raise ArgumentError if size > digits.count || size < 0
    (0..digits.count - size).map do |start|
      digits[start..start + size - 1].reduce(:*)
    end.max
  end

end
