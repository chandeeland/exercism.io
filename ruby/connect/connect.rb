module BookKeeping
  VERSION =1
end

class Board

  attr_reader :max_row, :max_col, :cells

  def initialize(board)
    @cells = {}
    board.each.with_index do |row, y|
      row.gsub(/ /,'').chars.each.with_index do |cell, x|
        @cells[x] = [] if @cells[x].nil?
        @cells[x][y] = cell
      end
    end
    @max_row = board.count - 1
    @max_col = cells.count - 1
  end

  # displays board, with winning path
  # bonus points
  def display
    puts
    (0..max_row).each do |y|
      print Array.new(y, ' ').join
      (0..max_col).each do |x|
        print "#{cells[x][y]} "
      end
      puts
    end
  end

  def winner
    pathfinder(top_start, 'O') { |x,y| y == max_row } ||
    pathfinder(left_start, 'X') { |x,y| x == max_col } || ''
  end

  private

  def adjacent_cells(x,y)
    [
      [x + 1,  y - 1],
      [x + 1,  y],
      [x,  y + 1],
      [x - 1,  y + 1],
      [x - 1,  y],
      [x,  y - 1]
    ]
  end

  def found(x,y)
    cells[x][y] = '*'
    true
  end

  def left_start
    (0..max_row).map { |y| [0, y] }
  end

  def top_start
    (0..max_col).map { |x| [x, 0] }
  end

  def pathfinder(starts, target, &block)
    @path_map = []
    starts.each do |cell|
      return target if step(*cell, target, &block)
    end
    false
  end

  def step(x, y, target, &block)
    return false if cells[x].nil?
    return false if cells[x][y].nil?
    return false if @path_map.include? [x,y]
    if cells[x][y] == target
      return found(x,y) if block.call(x,y)
      @path_map << [x,y]
      adjacent_cells(x,y).each do |neighbor|
        return found(x,y) if step(*neighbor, target, &block)
      end
    end
    false
  end

end
