class FlattenArray
  VERSION = 1
  def self.flatten(data)
    return [data] unless data.is_a? Array
    data.map{|x| self.flatten(x)}.reduce(:+).compact
  end

end
