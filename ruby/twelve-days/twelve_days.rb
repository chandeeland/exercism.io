module BookKeeping
  VERSION =2
end

class TwelveDays

  LYRICS = {
    'first' => "a Partridge in a Pear Tree.\n",
    'second' => 'two Turtle Doves, and',
    'third' => 'three French Hens,',
    'fourth' => 'four Calling Birds,',
    'fifth' => 'five Gold Rings,',
    'sixth' => 'six Geese-a-Laying,',
    'seventh' => 'seven Swans-a-Swimming,',
    'eighth' => 'eight Maids-a-Milking,',
    'ninth' => 'nine Ladies Dancing,',
    'tenth' => 'ten Lords-a-Leaping,',
    'eleventh' => 'eleven Pipers Piping,',
    'twelfth' => 'twelve Drummers Drumming,',
  }

  def self.song
    gifts = nil
    LYRICS.map do |first, gift|
      gifts = gifts.nil? ? gift : "#{gift} #{gifts}"
      "On the #{first} day of Christmas my true love gave to me, #{gifts}"
    end.join("\n")
  end
end
