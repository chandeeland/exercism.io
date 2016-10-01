class Gigasecond
  def self.from(dob)
    dob + (10 ** 9)
  end
end

module BookKeeping
  VERSION = 3
end
