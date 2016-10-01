class Cipher
  attr_reader :key

  def initialize(key= nil)
    raise ArgumentError if key.to_s =~ /[^a-z]/
    raise ArgumentError if key == ''
    @key_map = key.chars unless key.nil?
  end

  def key_map
    @key_map ||= (0..26).map { ('a'..'z').to_a.sample }
  end

  def key
    key_map.join
  end

  def encode(msg)
    msg.chars.map.with_index do |c, i|
      letterize((cipherize(c) + cipherize(key_map[i])) % 26)
    end.join
  end

  def decode(code)
    code.chars.map.with_index do |c, i|
      num = 26 + cipherize(c) - cipherize(key_map[i])
      letterize(num % 26)
    end.join
  end

  def cipherize(x)
    (x.ord - 'a'.ord)
  end

  def letterize(n)
    (n + 'a'.ord).chr
  end

end
