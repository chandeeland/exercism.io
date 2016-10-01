module Bookkeeping
  VERSION = 1
end

class Diamond
  def self.make_diamond(seed)
    size = seed.ord - 'A'.ord
    out = []
    ('A'..seed.upcase).each.with_index do |curr, i|
      pad = size - (curr.ord - 'A'.ord) + 1
      pattern = "% #{pad}s"
      pattern += "% #{ i * 2 }s" if i > 0
      pattern += "% #{pad}s"
      params = [curr]
      params += [curr] if i > 0
      out[i] = sprintf(pattern, *params, "\n")
      out[size * 2 - i] = sprintf(pattern, *params, "\n")
    end
    out.join
  end

end
