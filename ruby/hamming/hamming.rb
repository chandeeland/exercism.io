class Hamming
  def self.compute(a, b)
    raise ArgumentError unless a.length == b.length
    (0..a.length).map{|x| a[x] == b[x] ? 0 : 1}.inject(:+)
  end
end

module BookKeeping
  VERSION = 3
end


