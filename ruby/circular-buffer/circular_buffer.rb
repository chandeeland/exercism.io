class CircularBuffer

  class BufferEmptyException < StandardError
  end
  class BufferFullException < StandardError
  end

  attr_reader :buffer, :head, :tail, :size

  def initialize(size)
    @size = size
    clear
  end

  def clear()
    @buffer = Array.new(size)
    @head = 0
    @tail = 0
  end

  def read
    raise BufferEmptyException if empty?
    value = buffer[(head + size) % size]
    buffer[(head + size) % size] = nil
    @head += 1
    value
  end

  def write(value)
    raise BufferFullException if full?
    write!(value)
  end

  def write!(value)
    @head += 1 if full?
    @buffer[(tail + size) % size] = value
    @tail += 1
  end

  private

  def full?
    head + size <= tail
  end

  def empty?
    head == tail
  end

end
