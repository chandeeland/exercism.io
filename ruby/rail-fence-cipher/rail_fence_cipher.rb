class RailFenceCipher

  VERSION = 1

  def self.encode(msg, rows)
    board = Array.new(rows).map{[]}
    self.zigzag(msg, rows) do |y, char|
      board[y] << char
    end
    board.flatten.compact.join
  end

  def self.decode(code, rows)
    board = Array.new(rows).map{[]}
    encode = code.split('')
    rows.times do |r|
      self.zigzag(code, rows) do |y, char|
        board[r] << encode.shift if r == y
      end
    end

    ans = ''
    zigzag(code, rows) do |y, char|
      ans << board[y].shift
    end
    ans
  end

  private

  def self.zigzag(mesg, rows)
    y = 0
    delta_y = -1
    mesg.clone.split('').each do |char|
      yield(y, char)
      delta_y *= -1 if ( y == 0  || y == (rows - 1))
      y += delta_y unless rows == 1
    end
  end
end
