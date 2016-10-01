class TriangleError < StandardError
end

class Triangle
  attr_reader :a, :b, :c

  def initialize(a,b,c)
    @a = [a,b,c].min
    @c = [a,b,c].max
    @b = a + b + c - @a - @c
    validate
  end

  def kind
    return :equilateral if a == c
    return :isosceles if a == b || b == c
    :scalene
  end

  private
  def validate
    raise TriangleError if a <= 0
    raise TriangleError if a + b <= c
  end
end
