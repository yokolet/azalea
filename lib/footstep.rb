class Footstep
  attr_reader :row, :col

  def initialize(row, col)
    @row = row
    @col = col
  end

  def <=>(other)
    return -1 if @row < other.row
    return +1 if @row > other.row

    # on the same row
    return -1 if @col < other.col
    return +1 if @col > other.col

    # on the same row and col
    return 0
  end

  def eql?(row, col)
    return @row == row && @col == col
  end
end