module BookKeeping
  VERSION = 3
end

module Brackets

  def self.paired?(string)
    begin
      self.match(string,nil)
    rescue BracketError => e
      # puts e.to_s
      return false
    end
    true
  end

  private

  def self.match(string, find)
    i = 0
    while i < string.length
      char = string[i]
      if char == find
        return i + 1
      elsif self.close?(char)
        fail BracketError.new "found #{char} instead of #{find}"
      elsif self.open?(char)
        i += self.match(string[i+1..string.length], BRACKETS[char])
      end
      i += 1
    end
    fail BracketError.new "failed to find #{find}" unless find.nil?
    true
  end

  BRACKETS = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }

  def self.open?(char)
    BRACKETS.keys.include? char
  end

  def self.close?(char)
    BRACKETS.values.include? char
  end

  class BracketError < Exception
  end

end
