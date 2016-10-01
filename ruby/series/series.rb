class Series
  def initialize(str)
    @str = str.split('').map(&:to_i)
  end

  attr_reader :str

  def slices(size)
    raise ArgumentError if size > str.length
    (0..str.length - size).to_a.map do |x|
      str[x..x+size-1]
    end
  end
end
