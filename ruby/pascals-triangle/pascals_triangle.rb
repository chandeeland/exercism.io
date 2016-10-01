class Triangle

  attr_reader :rows

  def initialize(num_rows)
    @rows = []
    until rows.count == num_rows
      @rows << generate_row(rows.last)
    end
  end

  private

  def generate_row(prev_row = nil)
    return [1] if prev_row.nil?
    [1].tap do |out|
      (0..prev_row.count-2).each do |i|
        out << prev_row[i] + prev_row[i + 1]
      end
    end << 1
  end
end
