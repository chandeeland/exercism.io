module PigLatin

  VOWELS = %w(a e i o u xr yt)
  DOUBLES = %w(ch qu th)
  TRIPLES = %w(thr sch)

  def self.translate(msg)
    msg.split(' ')
      .map{ |word| self.translate_word(word) }
      .join(' ')
  end

  def self.translate_word(word)
    chars = word.chars
    # if VOWELS.include? chars[0]
    if (word =~ /#{VOWELS.join('|')}/) == 0
      word + 'ay'
    elsif (DOUBLES.include? chars[1..2].join) || (TRIPLES.include? chars[0..2].join)
      chars.rotate(3).join + 'ay'
    elsif DOUBLES.include? chars[0..1].join
      chars.rotate(2).join + 'ay'
    else
      chars.rotate.join + 'ay'
    end

  end


end
