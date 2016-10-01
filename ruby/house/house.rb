class House

  LINES = {
    'house that Jack built.' => 'lay in',
    'malt' => 'ate',
    'rat' => 'killed',
    'cat' => 'worried',
    'dog' => 'tossed',
    'cow with the crumpled horn' => 'milked',
    'maiden all forlorn' => 'kissed',
    'man all tattered and torn' => 'married',
    'priest all shaven and shorn' => 'woke',
    'rooster that crowed in the morn' => 'kept',
    'farmer sowing his corn' => 'belonged to',
    'horse and the hound and the horn' => ''
  }

  def self.recite
    story = ''
    [].tap do |out|
      LINES.each do |noun, verb|
        out << "This is the #{noun}\n#{story}"
        story = "that #{verb} the #{noun}\n#{story}"
      end
    end.join("\n")
  end
end
