module Clock
  def self.at(h,m)
    return CTime.new(h, m)
  end

  class CTime
    def initialize(hours,minutes)
      @hours = hours
      @minutes = minutes
      normalize
    end

    def to_s
      sprintf('%02d:%02d', hours, minutes)
    end

    def +(add)
      @minutes += add
      normalize
      self
    end

    def ==(ctime)
      ctime.to_s == to_s
    end

    private

    attr_reader :hours,:minutes

    def normalize
      @hours += minutes / 60
      @hours %= 24
      @minutes %= 60
    end

  end
end

module BookKeeping
  VERSION =2
end
