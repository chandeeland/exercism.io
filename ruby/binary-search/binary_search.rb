class BinarySearch
  attr_reader :list

  def initialize(list)
    raise ArgumentError if list != list.sort
    @list = list
  end

  def middle
    list.count / 2
  end

  def search_for(target)
    if target == pivot
      return middle
    elsif list.count == 1
      raise RuntimeError
    elsif target < pivot
      BinarySearch.new(left).search_for(target)
    else
      middle + 1 + BinarySearch.new(right).search_for(target)
    end
  end

  private

  def pivot
    list[middle]
  end

  def left
    list[0..middle - 1]
  end

  def right
    list[middle + 1..list.count]
  end
end
