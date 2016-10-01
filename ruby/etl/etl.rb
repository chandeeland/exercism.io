class ETL



  def self.transform(old)
    {}.tap do |output|
      old.each do |score, letters|
        output.merge!(self.transform_row(score,letters))
      end
    end
  end

  def self.transform_row(score, letters)
    (self.keys(letters).zip(self.values(score,letters))).to_h
  end

  def self.keys(letters)
    letters.map(&:downcase)
  end

  def self.values(score, letters)
    (1..letters.length).to_a.map{score}
  end

end
