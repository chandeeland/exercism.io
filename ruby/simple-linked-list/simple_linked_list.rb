class Element
  attr_accessor :next
  attr_reader :datum

  def initialize(datum, n = nil)
    @datum = datum
    @next = n
  end

  def tail?
    datum
  end

  def walk(&block)
    block.call datum
    @next.walk(&block) unless @next.nil?
  end

end

class SimpleLinkedList
  attr_reader :head

  def self.from_a(values)
    SimpleLinkedList.new.tap do |list|
      values.reverse.each do |v|
        list.push(v)
      end unless values.nil?
    end
  end

  def to_a
    [].tap do |out|
      head.walk do |x|
        out << x
      end unless empty?
    end
  end

  def reverse
    curr = head.clone unless empty?
    SimpleLinkedList.new.tap do |list|
      head.walk do |x|
        list.push(x)
      end unless empty?
    end
  end

  def push(value)
    @head = Element.new(value, head)
  end

  def empty?
    head.nil?
  end

  def peek
    head.datum unless empty?
  end

  def pop
    oldhead = head.datum
    @head = head.next
    oldhead
  end

  def size
    out = 0
    head.walk do |x|
      out += 1
    end unless empty?
    out
  end

end
