class Matrix
  def initialize(text)
    @rows = text.split("\n").map{|row| row.split(' ').map(&:to_i)}
    @columns = rows.transpose
  end

  attr_reader :rows, :columns

  def saddle_points
    [].tap do |points|
      columns.each.with_index do |c, x|
        rows.each.with_index do |r, y|
          points << [y,x] if mcols[x] == c[y] && r[x] == mrows[y]
        end
      end
    end
  end

  private

  def mrows
    rows.map(&:max)
  end

  def mcols
    columns.map(&:min)
  end

end
