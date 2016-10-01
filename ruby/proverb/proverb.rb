class Proverb

  attr_reader :words, :q

  def initialize(*words, qualifier: '')
    @words = words
    @q = "#{qualifier} " unless qualifier == ''
  end

  def to_s
    [].tap do |out|
      (0..words.length-2).each do |i|
        out << "For want of a #{words[i]} the #{words[i+1]} was lost."
      end
      out << "And all for the want of a #{q}#{words.first}."
    end.join("\n")
  end

end
