class Robot

  attr_reader :bearing, :coordinates

  BEARINGS = %i(north east south west)
  ADVANCER = [[0,1],[1,0],[0,-1],[-1,0]]

  def at(x,y)
    @coordinates = [x,y]
  end

  def advance
    dx, dy = ADVANCER[BEARINGS.find_index(bearing)]
    x,y = coordinates
    @coordinates = [x + dx, y + dy]
  end

  def orient(bearing)
    raise ArgumentError unless BEARINGS.include? bearing
    @bearing = bearing
  end

  def turn_right
    turn(1)
  end

  def turn_left
    turn(-1)
  end

  private

  def turn(deg)
    orient BEARINGS[(BEARINGS.find_index(bearing) + deg) % 4]
  end

end

class Simulator
  INSTRUCTIONS = {
    L: :turn_left,
    R: :turn_right,
    A: :advance
  }

  def instructions(code)
    code.chars.map { |x| INSTRUCTIONS[x.to_sym] }
  end

  def place(robot, x: 1, y: 1, direction: :east)
    robot.at(x,y)
    robot.orient(direction)
  end

  def evaluate(robot, code)
    instructions(code).each do |action|
      robot.send(action.to_sym)
    end
  end
end
