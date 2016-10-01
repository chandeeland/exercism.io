class Array
  def keep
    [].tap do |out|
      self.each do |element|
        out << element if yield(element)
      end
    end
  end

  def discard
    [].tap do |out|
      self.each do |element|
        out << element unless yield(element)
      end
    end
  end
end
