class Frame

  def initialize
    @scores = []
  end

  attr_reader :scores

  def strike?
    scores[0] == 10
  end

  def spare?
    scores[0].to_i + scores[1].to_i == 10 && !strike?
  end

  def max_scores
    strike? ? 1 : 2
  end

  def open?
    scores.count < max_scores
  end

  def roll(pins)
    valid(pins)
    scores << pins
  end

  def valid(pins)
    raise RuntimeError if pins > 10 - scores[0].to_i
  end

  def score
    scores
  end
end

class Frame10 < Frame
  def max_scores
    return 3 if strike? or spare?
    2
  end

  def double_strike?
    strike? && scores[1] == 10
  end

  def valid(pins)
    if strike?
      if double_strike?
        raise RuntimeError if pins > 10
      else
        raise RuntimeError if pins > 10 - scores[1].to_i
      end
    elsif spare?
      raise RuntimeError if pins > 10
    else
      super(pins)
    end
  end
end

class Game
  def initialize
    @frames = Array.new(9).map{Frame.new} + [Frame10.new]
    @current_frame_index = 0
  end

  attr_reader :frames, :current_frame_index

  def current_frame
    raise RuntimeError if current_frame_index > 9
    unless frames[current_frame_index].open?
      @current_frame_index += 1
    end
    frames[current_frame_index]
  end

  def roll(pins)
    raise RuntimeError if pins < 0
    raise RuntimeError unless frames.last.open?
    # puts current_frame.score.inspect
    current_frame.roll(pins)
  end

  def score
    raise RuntimeError if frames[9].open?
    scores = frames.map(&:score)
    total = []
    while (scores.count > 0)
      curr = scores.shift
      if curr == [10]
        total += scores.flatten[0..1]
      elsif curr.reduce(:+) == 10
        total += [scores.flatten[0]]
      end
      total += curr
    end
    total.flatten.reduce(:+)
  end

end


module BookKeeping
  VERSION = 1
end
