class Canvas
  attr_reader :canvas_size, :footsteps

  def initialize(canvas_size)
    @canvas_size = canvas_size
    @footsteps = []
  end

  def insert(footstep)
    @footsteps << footstep
    @footsteps.sort!
  end

  def show
    (0...@canvas_size).each do |row|
      line = ""
      (0...@canvas_size).each do |col|
        if @footsteps[0] && @footsteps[0].eql?(row, col)
          @footsteps.shift
          line << "X "
        else
          line << ". "
        end
      end
      line.chop!
      print line + "\n"
    end
  end
end