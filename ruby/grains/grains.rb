class Grains

  @@squares = [1]

  def self.square(n)
    @@squares[n-1] ||= square(n-1) * 2
  end

  def self.total
    square(64)
    @@squares[0..63].inject(:+)
  end
end
