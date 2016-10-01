class Deque
  class Node
    attr_accessor :back, :forward
    attr_reader :value

    def initialize(back = nil, value = nil, forward = nil)
      @value = value
      @back = back
      @forward = forward
    end
  end

  attr_accessor :head, :tail

  def pop
    value = tail.value
    @tail = tail.back
    if tail.nil?
      @head = nil
    else
      tail.forward = nil
    end
    value
  end

  def push(value)
    if tail.nil?
      @head = @tail = Node.new(nil, value, nil)
    else
      tail.forward = Node.new(tail, value, nil)
      @tail = tail.forward
    end
  end

  def shift
    value = head.value
    @head = head.forward
    if head.nil?
      @tail = nil
    else
      head.back = nil
    end
    value
  end

  def unshift(value)
    if head.nil?
      @head = @tail = Node.new(nil, value, nil)
    else
      head.back = Node.new(nil, value, head)
      @head = head.back
    end
  end
end
