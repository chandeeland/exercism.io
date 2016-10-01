class WordProblem

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def answer
    math = query.gsub(/What is/,'').gsub(/\?\z/,'').split(' ')
    a = math.shift
    while math.count > 0
      op = math.shift
      math.shift if op == 'multiplied' || op == 'divided'
      a = send(op.to_sym, a.to_i, math.shift.to_i)
    end
    a
  end

  def plus(a,b)
    a + b
  end

  def minus(a,b)
    a - b
  end

  def multiplied(a, b)
    a * b
  end

  def divided(a,b)
    a / b
  end

  def method_missing
    raise ArgumentError
  end

end
