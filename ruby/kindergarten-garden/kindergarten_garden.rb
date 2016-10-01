class Garden

  PLANTS = {
    c: :clover,
    g: :grass,
    r: :radishes,
    v: :violets
  }

  attr_reader :rows

  def initialize(rows,
    students = %w(Alice Bob Charlie David
      Eve Fred Ginny Harriet
      Ileana Joseph Kincaid Larry)
  )
    @rows = rows.downcase
      .split("\n")
      .map do |row|
        row.chars.map { |x| PLANTS[x.to_sym] }
      end

    kids = students.sort.map{|kid| kid.downcase.to_sym}
      .zip( (0..(students.count - 1)).map { |x| x * 2 } )

    kids.each do |kid, num|
      define_singleton_method(kid, lambda {
        @rows.map do |row|
          [ row[num], row[num + 1] ]
        end.flatten
      })
    end
  end
end
