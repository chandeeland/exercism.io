class Nucleotide
  AMINO = ['A','T','C','G']
  def self.from_dna(strand)
    raise ArgumentError if strand =~ /[^#{AMINO.join}]/
    DNA.new(strand)
  end

  class DNA
    def initialize(strand)
      @strand = strand.upcase
    end

    attr_reader :strand

    def count(amino)
      strand.length - strand.gsub(amino.upcase, '').length
    end
    
    def histogram
      base_histogram.tap do |histogram|
        strand.split('').each do |x|
          histogram[x] += 1
        end
      end
    end

    private

    def base_histogram
      Nucleotide::AMINO.zip(Array.new(4,0)).to_h
    end


  end
end
