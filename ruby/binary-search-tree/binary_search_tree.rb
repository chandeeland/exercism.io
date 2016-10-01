class Bst

  def initialize(root = nil)
    @data = root
  end

  attr_reader :data

  def left
    @left ||= Bst.new
  end

  def right
    @right ||= Bst.new
  end

  def insert(n)
    if data.nil?
      @data = n
    elsif n > data
      right.insert(n)
    else
      left.insert(n)
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?
    left.each(&block) unless @left.nil?
    block.call(self.data)
    right.each(&block) unless @right.nil?
  end

  VERSION = 1
end
