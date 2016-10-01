class Deque
  class Node
    attr_accessor :prev, :next
    def initialize(value, prev_node, next_node)
      @value = value
      @prev = prev_node
      @next = next_node
    end

    def to_s
      @value
    end
  end

  attr_accessor :head, :tail

  def pop
    value = tail.to_s
    @tail = @tail.prev
    @tail.next = nil unless @tail.nil?
    value
  end

  def push(value)
    if tail.nil?
      @head = Node.new(value, nil, nil)
      @tail = @head
    else
      tail.next = Node.new(value, tail, nil)
      @tail = tail.next
      puts [@head.to_s, @tail.to_s ]
    end
  end

  def to_a
    curr = head.clone unless head.nil?
    begin
      puts curr.to_s
      puts curr.next
      curr = curr.next
    end while curr
  end
end
