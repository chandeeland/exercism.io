class Frame
  def initialize(n)
    @frameno = n
    @rolls = []
  end

  attr_reader :rolls, :frameno, :max_rolls

  def max_rolls
    if frameno == 10
      3 if strike? || spare?
    elsif strike?
      return 1
    end
    2
  end

  def open?
    rolls.count < max_rolls
  end

  def strike?
    rolls.first == 10
  end

  def spare?
    rolls[0,1].reduce(:+) == 10 && !strike?
  end

  def next_frame
    @next_frame ||= begin
      Frame.new(frameno + 1) if frameno < 10
    end
  end

  def roll(pins)
    raise RuntimeError if pins < 0
    if open?
      rolls << pins
    else
      next_frame.roll(pins) if frameno != 10
    end
  end

  def score
    total = rolls.reduce(:+)
    if spare?
      return total + next_frame.strike(1)
    elsif strike?
      return total + next_frame.strike(2)
    end
    total.to_i
  end

  def strike(n)
    return 0 if open? || n < 1
    return rolls[0] + next_frame.strike(n - 1) if strike? && n > 1
    return rolls[0..[n-1, rolls.count-1].min].reduce(:+)
  end

  def score_all
    score + child_scores
  end

  def child_scores
    return 0 if next_frame.nil?
    next_frame.score_all
  end
end

class Game

  def initialize
    @frames = Frame.new(1)
  end

  attr_reader :frames

  def roll(pins)
    frames.roll(pins)
  end

  def score
    frames.score_all
  end

end
