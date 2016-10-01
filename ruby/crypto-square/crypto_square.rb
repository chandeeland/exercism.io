class Crypto
  def initialize(text)
    @text = text
  end

  attr_reader :text

  def normalize_plaintext
    @normalize_plaintext ||= text.downcase.gsub(/[^\d\w]/,'')
  end

  def size
    rows
  end

  def plaintext_segments
    segments.map(&:join)
  end

  def ciphertext
    ciphertext_raw.join.gsub('@','')
  end

  def normalize_ciphertext
    ciphertext_raw.each_slice(cols).map(&:join).join(' ').gsub('@','')
  end

  private

  def rows
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def cols
    Math.sqrt(normalize_plaintext.length).round
  end


  def ciphertext_raw
    @ciphertext_raw  ||= segments
      .map{|x| x + Array.new(size-x.length,'@')}
      .transpose
      .flatten
  end

  def segments
    @segments ||= normalize_plaintext.split('').each_slice(size)
  end

end
