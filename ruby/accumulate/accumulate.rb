class Array
  def accumulate
    [].tap do |out|
      self.each do |x|
        out << yield(x)
      end
    end
  end
end
