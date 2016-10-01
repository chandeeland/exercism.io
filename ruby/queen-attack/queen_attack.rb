class Queens
  def initialize(white: [0 ,3], black: [7, 3])
    raise ArgumentError if white == black
    @white = white
    @black = black
  end

  attr_accessor :white, :black

  def to_s
    board = Array.new(8).map{ Array.new(8, '_') }
    board[white.first][white.last] = 'W'
    board[black.first][black.last] = 'B'
    board.map{|row| row.join(' ')}.join("\n")
  end

  def attack?
    same_column? || same_row? || same_diagonal?
  end

  def same_column?
    white.first == black.first
  end

  def same_row?
    white.last == black.last
  end

  def same_diagonal?
    (white.last - black.last).abs == (white.first - black.first).abs
  end
end
