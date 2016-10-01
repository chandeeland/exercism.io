class Anagram
  def initialize(s)
    @seed = s.downcase
    @anagrams = seed.split('')
      .permutation(seed.length).map(&:join)
      .select {|p| p != seed}
  end

  attr_reader :anagrams, :seed

  def match(candidates)
    candidates.select{|c| anagrams.include? c.downcase}
  end
end
