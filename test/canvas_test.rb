$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'contest'
require 'canvas'
require 'footstep'
require 'turtle'

class CanvasTest < Test::Unit::TestCase

  def setup
    @canvas = Canvas.new(11)
  end

  def teardown
    # Do nothing
  end

  test "canvas has an array of footsteps" do
    @canvas.insert(Footstep.new(5,4))
    assert_equal(1, @canvas.footsteps.length)
  end

  test "canvas sorts footsteps" do
    @canvas.insert(Footstep.new(5, 5))
    @canvas.insert(Footstep.new(4, 4))
    assert_equal(4, @canvas.footsteps[0].row)

    @canvas.insert(Footstep.new(5, 0))
    assert_equal(0, @canvas.footsteps[1].col)

    @canvas.insert(Footstep.new(6, 1))
    assert_equal(6, @canvas.footsteps.last.row)
  end

  test "canvas shows footsteps" do
    turtle = Turtle.new(11)
    turtle.rt(90)
    turtle.fd(5)
    turtle.rt(135)
    turtle.fd(5)
    turtle.canvas.show
  end
end