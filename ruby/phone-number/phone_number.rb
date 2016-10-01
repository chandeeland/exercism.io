class PhoneNumber
  def initialize(string)
    @number = string.gsub(/[^\d]/,'')
    @number = "0000000000" unless (string =~ /[a-zA-Z]/).nil?
    @number = "0000000000" if number.to_i > 19_999_999_999
    @number = "0000000000" if number.to_i <= 999_999_999
    @number = number.gsub(/1(\d{10})/) { $1 }
  end

  attr_reader :number

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..9]}"
  end

end
