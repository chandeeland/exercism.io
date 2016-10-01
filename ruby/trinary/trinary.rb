class Trinary
  def initialize(n)
    @trinary = (n =~ /[^012]/).nil? ? n.split('').map(&:to_i) : [0]
  end

  attr_accessor :trinary

  def to_decimal
    trinary.reverse.map.with_index {|t, i| t * 3 ** i}.reduce(:+)
  end
end

module BookKeeping
  VERSION = 1
end
