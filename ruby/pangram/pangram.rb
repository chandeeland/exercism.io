module Pangram
  def self.is_pangram?(test)
    foo = test.downcase.gsub(/[^a-z]/,'').split('').uniq.count == 26
  end
end

module BookKeeping
  VERSION = 2
end
