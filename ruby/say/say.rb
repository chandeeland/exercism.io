class Say
  def initialize(num)
    raise ArgumentError if num < 0 || num > 999_999_999_999
    @num = num.to_i
    @triples = num.to_s.split('').reverse
      .each_slice(3)
      .map { |x| Array.new(3 - x.count, 0) + x.reverse}
      .reverse
  end

  attr_reader :triples, :num

  ONES = %w(zero one two three four five six seven eight nine)
  TEENS = %w(ten eleven twelve thirteen fourteen fifteen) + (6..9).map{|x| "#{ONES[x]}teen"}
  TENS = [nil] + %w(ten twenty thirty forty fifty sixty seventy eighty ninety)
  MAG = %w(hundred thousand million billion trillion)

  def english_double(t,o)
    num = t * 10 + o
    if num < 10
      return ONES[num]
    elsif num < 20
      return TEENS[num-10]
    end
    out = []
    out << TENS[t]
    out << ONES[o] if o > 0
    out.join('-')
  end

  def english_triple(h,t,o)
    return nil if h +t +o  == 0
    out = []
    out << "#{ONES[h]} hundred" if (h > 0)
    out << english_double(t,o) if t+o > 0
    out.join(' ')
  end

  def in_english
    return ONES[0] if num == 0
    out = []
    triples.each.with_index do |trip, i|
      m = triples.count - i - 1
      english = english_triple( *trip.map(&:to_i) )
      out << english
      out << MAG[m] if m > 0 && english
    end
    return out.compact.join(' ')
  end

end
