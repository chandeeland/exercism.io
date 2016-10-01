class SumOfMultiples
  def initialize(*args)
    @factors = args
  end

  attr_reader :factors

  def to(limit)
    (1..limit-1)
      .select {|x| factors.map{|f| x % f == 0 }.any? }
      .reduce(:+) || 0
  end
end
