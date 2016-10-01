module Atbash

  def self.encode(msg)
    msg = msg.downcase.gsub(/\W/,'')
    self.cipher(msg).each_slice(5).map(&:join).join(' ')
  end

  def self.cipher(msg)
    msg.chars.map do |x|
      if x =~ /[a-z]/
        ((25 - (x.ord - 97)) +97).chr
      else
        x
      end
    end
  end

end
