class InvalidCodonError < ArgumentError
end

class Translation

  CODONS = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCG' => 'Serine',
    'UCA' => 'Serine',
    'UCC' => 'Serine',
    'UCU' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }

  def self.of_codon(codon)
    raise InvalidCodonError unless CODONS.key? codon
    CODONS[codon]
  end

  def self.of_rna(strand)
    strand.scan(/.{3}/)
      .map{ |codon| self.of_codon(codon) }
      .join('@')
      .split('STOP')
      .first.split('@')
  end
end
