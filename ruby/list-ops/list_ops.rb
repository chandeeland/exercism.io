class ListOps
  def self.arrays(arr)
    count = 0
    arr.each { count += 1 }
    count
  end

  # avoiding each_reverse
  def self.reverser(arr)
    [].tap do |reverse|
      self.walk(arr) { reverse << arr.pop }
    end
  end

  # avoiding +
  def self.concatter(*arrs)
    [].tap do |out|
      arrs.each do |arr|
        self.walk(arr) { out << arr.shift}
      end
    end
  end

  def self.mapper(arr, &block)
    self.walk(arr, &block)
  end

  def self.walk(arr, &block)
    max = self.arrays(arr) - 1
    (0..max).to_a.each do |curr|
      puts arr[curr]
      block.call(arr[curr])
    end
  end

end
