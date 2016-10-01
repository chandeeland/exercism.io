module BookKeeping
  VERSION = 1
end

class CustomSet
  attr_reader :members
  def initialize(members)
    @members = members.sort.uniq
  end

  def add(value)
    @members << value
    @members = members.sort.uniq
    self
  end

  def ==(other)
    members == other.members
  end

  def difference(other)
    CustomSet.new(members - other.members)
  end

  def empty?
    members.empty?
  end

  def intersection(other)
    CustomSet.new(members & other.members)
  end

  def member?(value)
    members.include? value
  end

  def subset?(other)
    intersection(other).members == members
  end

  def disjoint?(other)
    intersection(other).members == []
  end

  def union(other)
    CustomSet.new(other.members + members)
  end

end
