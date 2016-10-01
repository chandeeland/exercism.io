class Phrase

  def initialize(phrase)
    @words = phrase.downcase.gsub(/[^a-z '0-9]/,' ').split(' ').compact
  end

  attr_reader :words

  def word_count
    {}.tap do |count|
      words.each do |w|
        w = w.gsub(/'(.*)'/) { $1 }
        count[w] = 0 unless count.key? w
        count[w] += 1
      end
    end
  end

end

module BookKeeping
  VERSION = 1
end
