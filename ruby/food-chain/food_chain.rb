module BookKeeping
  VERSION = 2
end

module FoodChain

  def self.song
    CHAIN.keys.map.with_index do |_animal, i|
      self.verse(i)
    end.join("\n\n")
  end

  CHAIN = {
    'fly' => "I don't know why she swallowed the fly.",
    'spider' => "It wriggled and jiggled and tickled inside her.",
    'bird' => "How absurd to swallow a bird!",
    'cat' => "Imagine that, to swallow a cat!",
    'dog' => "What a hog, to swallow a dog!",
    'goat' => "Just opened her throat and swallowed a goat!",
    'cow' => "I don't know how she swallowed a cow!",
    'horse' => "She's dead, of course!"
  }

  def self.verse(i)
    animal = CHAIN.keys[i]
    [].tap do |out|
      out << "I know an old lady who swallowed a #{animal}.\n"
      out << "#{CHAIN[animal]}\n" unless animal == 'fly'
      unless animal == 'horse'
        out << self.chain(i)
        out << "#{CHAIN['fly']} Perhaps she'll die."
      end
    end.join
  end

  def self.chain(i)
    return '' if i < 1
    spider = CHAIN.keys[i]
    "She swallowed the #{spider} to catch the #{self.fly(i-1)}.\n" + self.chain(i-1)
  end

  def self.fly(i)
    animal = CHAIN.keys[i]
    [].tap do |out|
      out << animal
      if animal == 'spider'
        out << CHAIN[animal].sub('It','that').sub('.','')
      end
    end.join(' ')
  end

end
