class Integer
  BASES = {
    1000 => 'M',
    500 => 'D',
    100 => 'C',
    50 => 'L',
    10 => 'X',
    5 => 'V',
    1 => 'I'
  }
  BASE_KEYS = BASES.keys

  def to_roman
    out = ''
    BASES.each do |base, char|
      if base <= self
        out << char
        out << (self - base).to_roman
        break()
      end
    end
    optimize(out)
  end

  def optimize(rom)
    niner(dequad(rom))
  end

  def dequad(rom)
    rom.gsub(/((.)\2{3})/) do
      left = index_of($2)
      right = index_of($2,1)
      "#{BASES[left]}#{BASES[right]}"
    end
  end

  def niner(rom)
    rom.gsub(/(.)(.)\1/) do
      if $2 == BASES[index_of($1,-1)]
        "#{BASES[index_of($2)]}#{BASES[index_of($1,1)]}"
      else
        "#{$1}#{$2}#{$1}"
      end
    end
  end

  def index_of(char, offset = 0)
    BASE_KEYS.select.with_index do |bk, i|
      BASES[BASE_KEYS[i + offset]] == char
    end.first
  end
end


module BookKeeping
  VERSION = 2
end
