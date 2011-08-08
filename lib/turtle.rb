# The Turtle class saves a current position in row/col and orientation.
# In my first version, this class is almost equivalent to Cursor class.
# Not like Cursor class, Turtle class has methods to change its position
# and orientation.

class Turtle
  attr_reader :row, :col, :orientation, :canvas

  # directions
  #         0
  #         N
  #    7 NW   NE 1
  # 6 W           E 2
  #    5 SW   SE 3
  #         S
  #         4
  NORTH      = 0
  NORTH_EAST = 1
  EAST       = 2
  SOUTH_EAST = 3
  SOUTH      = 4
  SOUTH_WEST = 5
  WEST       = 6
  NORTH_WEST = 7

  def initialize(canvas_size)
    @row = canvas_size.to_i / 2
    @col = canvas_size.to_i / 2
    @orientation = NORTH
    @footsteps = []
    @canvas = Canvas.new(canvas_size)
  end

  def rt(degree)
    o = @orientation + degree.to_i / 45
    @orientation = o <= NORTH_WEST ? o : o - 8
  end

  def lt(degree)
    o = @orientation - degree.to_i / 45
    @orientation = o >= NORTH ? o : o + 8
  end

  FD_DIFF = {NORTH => [-1, 0], NORTH_EAST => [-1, 1], EAST => [0, 1], SOUTH_EAST => [1, 1],
             SOUTH => [1, 0], SOUTH_WEST => [1, -1], WEST => [0, -1], NORTH_WEST => [-1, -1]}

  def fd(unit)
    (1..unit.to_i).each do
      @row += FD_DIFF[@orientation][0]
      @col += FD_DIFF[@orientation][1]
      @canvas.insert(Footstep.new(@row, @col))
    end
  end

  BK_DIFF = {NORTH => [1, 0], NORTH_EAST => [1, -1], EAST => [0, -1], SOUTH_EAST => [-1, -1],
             SOUTH => [-1, 0], SOUTH_WEST => [-1, 1], WEST => [0, 1], NORTH_WEST => [1, 1]}

  def bk(unit)
    (1..unit.to_i).each do
      @row += BK_DIFF[@orientation][0]
      @col += BK_DIFF[@orientation][1]
      @canvas.insert(Footstep.new(@row, @col))
    end
  end
end