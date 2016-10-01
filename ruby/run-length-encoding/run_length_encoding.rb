class RunLengthEncoding
  def self.encode(data)
    count = 0
    prev = nil
    code = ''
    data.split('').each do |curr|
      if curr == prev
        count += 1
      else
        code << count.to_s if count > 1
        code << prev.to_s
        prev = curr
        count = 1
      end
    end
    code << count.to_s if count > 1
    code << prev.to_s
    code
  end

  def self.decode(code)
    data = ''
    code.gsub(/(\d*)([^\d])/) do
      count = $1.to_i
      count += 1 if count == 0
      count.times do |x|
        data << $2
      end
    end
    data
  end
end

module BookKeeping
  VERSION = 2
end
