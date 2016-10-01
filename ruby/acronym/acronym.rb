class Acronym

  def self.abbreviate(msg)
    msg.gsub(/([^A-Z ])([A-Z])/,'\1 \2')
      .gsub(/-/,' ').split(' ')
      .compact.map{|w| w[0]}.join.upcase
  end
end

module BookKeeping
  VERSION= 1
end
