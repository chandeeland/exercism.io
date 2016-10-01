class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  MODES = {
    teenth: (13..19),
    first: (1..7),
    second: (8..14),
    third: (15..21),
    fourth: (22..28),
    last: (22..31).to_a.reverse
  }

  def day(dow, mode)
    matches = MODES[mode].map {|day|
      begin
        Date.parse("#{year}-#{month}-#{day}")
      rescue
        BadDate.new
      end
    }.select {
      |x| x.send("#{dow}?".to_sym)
    }.first
  end

  attr_reader :month, :year

  class BadDate
    def method_missing(_m)
      false
    end
  end
end
