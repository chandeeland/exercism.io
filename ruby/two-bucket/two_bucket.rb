module BookKeeping
  VERSION = 2
end

class TwoBucket

  class Bucket
    attr_reader :max, :moves
    attr_accessor :value

    def initialize(max)
      @max = max
      @value = 0
      @moves = 0
    end

    def fill
      @moves += 1
      @value = max
    end

    def empty?
      value == 0
    end

    def full?
      value == max
    end

    def empty
      @moves += 1
      @value = 0
    end

    def fill_from(bucket)
      @moves += 1
      change = [max - value, bucket.value].min
      @value += change
      bucket.value = bucket.value - change
    end
  end

  attr_reader :goal, :buckets, :start

  def initialize(bucket1, bucket2, goal, start)
    one = Bucket.new(bucket1)
    two = Bucket.new(bucket2)
    @goal = goal
    @start = start
    @buckets = start == 'one' ? [one,two] : [two,one]
  end

  def moves
    results[:moves]
  end

  def goal_bucket
    results[:goal_bucket]
  end

  def other_bucket
    results[:other_bucket]
  end

  private

  def results
    until buckets.map(&:value).include? goal
      buckets.first.fill if buckets.first.empty?
      buckets.last.empty if buckets.last.full?
      buckets.last.fill_from(buckets.first)
    end
    if buckets.first.value == goal
      goal_bucket = (start == 'one') ? 'one' : 'two'
    else
      goal_bucket = (start == 'one') ? 'two' : 'one'
    end
    {
      moves: buckets.map(&:moves).reduce(:+),
      goal_bucket: goal_bucket,
      other_bucket: buckets.map(&:value).reduce(:+) - goal
    }
  end
end
