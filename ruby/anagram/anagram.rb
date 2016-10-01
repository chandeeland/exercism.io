class Anagram
  attr_reader :seed

  def initialize(s)
    @seed = s.downcase
  end

  def match(candidates)
    target = munge(seed)
    candidates.select{|c| munge(c) == target && c.downcase != seed }
  end

  private

  def munge(s)
    s.downcase.chars.sort.join
  end
end
