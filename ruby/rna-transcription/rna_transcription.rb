class Complement
  RNA = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }
  def self.of_dna(dna)
    rna = dna.split('').map{|a| RNA[a]}
    return "" unless rna.compact.count == dna.length
    rna.join('')
  end
end
module BookKeeping
  VERSION = 4
end
