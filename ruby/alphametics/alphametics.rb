class Alphametics

  def solve(query)
    @query = query
    parser = Parser.new(query, keys)

    ciphers.detect do |cipher|
      parser.cipher = cipher
      parser.parse
    end
  end

  attr_reader :query

  def ciphers
    @ciphers ||= (0..9).to_a.permutation(keys.count)
    .map{ |perm| keys.zip(perm).to_h }
  end

  def keys
    @keys ||= query.gsub(/[^A-Z]/,'').split('').uniq
  end

end


class Parser
  def initialize(text, keys)
    @keys = keys
    @text = clean(text.downcase)
  end

  attr_reader :text, :keys, :changes, :cipher

  def parse
    instance_eval(text)
  end

  def change_keys
    @changes ||= begin
      unused = ('A'..'Z').to_a - keys
      {
        'A' => unused.pop,
        'E' => unused.pop,
        'I' => unused.pop,
        'O' => unused.pop,
        'U' => unused.pop
       }
    end
  end

  def cipher=(cipher)
    cipher = cipher.clone
    change_keys.keys.each do |k|
      cipher[change_keys[k]] = cipher[k]
      cipher.delete(k)
    end
    @cipher = cipher
  end

  def clean(text)
    clean = text.gsub('^','**')
    change_keys.keys.each do |l|
      clean = clean.gsub(l.downcase, change_keys[l].downcase)
    end
    clean
  end

  def method_missing(m)
    mm = m.to_s.split('').map{|x| cipher[x.upcase]}.join
    return mm.to_i unless mm[0] == '0'
    -12345
  end
end

module BookKeeping
  VERSION = 2
end
