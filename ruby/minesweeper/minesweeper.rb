class ValueError < StandardError
end
class Board
  def self.transform(input)
    output = input.map(&:chars)
    self.validate(output)
    (1..output.count - 2).each do |row|
      (1..output[row].count - 2).each do |col|
        mines = 0
        (row-1..row+1).each do |y|
          (col-1..col+1).each do |x|
            mines += 1 if output[y][x] == '*'
          end
        end
        raise ValueError unless output[row][col] =~ /[ \*]/
        output[row][col] = mines if mines > 0 && output[row][col] == ' '
      end
    end
    output.map(&:join)
  end

  def self.validate(output)
    if output.select{|row| row.count != output.first.count}.count > 0
      raise ValueError
    end

    unless output.first.join =~ /^\+-+\+$/
      raise ValueError
    end
    unless output.last.join =~ /^\+-+\+$/
      raise ValueError
    end
  end
end
