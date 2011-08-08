$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'contest'
require 'turtle'

class TurtleTest < Test::Unit::TestCase

  def setup
    @turtle = Turtle.new(11)
    @initial_row = 11 / 2
    @initial_col = 11 / 2
  end

  test "turtle has an initial position" do
    assert_equal(@initial_row, @turtle.row)
    assert_equal(@initial_col, @turtle.col)
  end

  test "turtle has an initial orientation" do
    assert_equal(Turtle::NORTH, @turtle.orientation)
  end

  test "turtle can change an orientation by some degree clockwise" do
    @turtle.rt(90)
    assert_equal(Turtle::EAST, @turtle.orientation)
    @turtle.rt(135)
    assert_equal(Turtle::SOUTH_WEST, @turtle.orientation)
  end

  test "turtle can change an orientation by some degree counterclockwise" do
    @turtle.lt(90)
    assert_equal(Turtle::WEST, @turtle.orientation)
    @turtle.lt(135)
    assert_equal(Turtle::SOUTH_EAST, @turtle.orientation)
  end

  test "turtle can go forward to north by given units" do
    @turtle.fd(5)
    assert_equal(@initial_row - 5, @turtle.row)
    assert_equal(@initial_col, @turtle.col)
  end

  test "turtle can go forward to north-east by given units" do
    @turtle.rt(45)
    @turtle.fd(5)
    assert_equal(@initial_row - 5, @turtle.row)
    assert_equal(@initial_col + 5, @turtle.col)
  end

  test "turtle can go forward to east by given units" do
    @turtle.rt(90)
    @turtle.fd(5)
    assert_equal(@initial_row, @turtle.row)
    assert_equal(@initial_col + 5, @turtle.col)
  end

  test "turtle can go forward to south-east by given units" do
    @turtle.rt(135)
    @turtle.fd(5)
    assert_equal(@initial_row + 5, @turtle.row)
    assert_equal(@initial_col + 5, @turtle.col)
  end

  test "turtle can go forward to south by given units" do
    @turtle.rt(180)
    @turtle.fd(5)
    assert_equal(@initial_row + 5, @turtle.row)
    assert_equal(@initial_col, @turtle.col)
  end

  test "turtle can go forward to south-west by given units" do
    @turtle.lt(135)
    @turtle.fd(5)
    assert_equal(@initial_row + 5, @turtle.row)
    assert_equal(@initial_col - 5, @turtle.col)
  end

  test "turtle can go forward to west by given units" do
    @turtle.lt(90)
    @turtle.fd(5)
    assert_equal(@initial_row, @turtle.row)
    assert_equal(@initial_col - 5, @turtle.col)
  end

  test "turtle can go forward to north-west by given units" do
    @turtle.lt(45)
    @turtle.fd(5)
    assert_equal(@initial_row - 5, @turtle.row)
    assert_equal(@initial_col - 5, @turtle.col)
  end

  test "turtle can go backward against north by given units" do
    @turtle.bk(5)
    assert_equal(@initial_row + 5, @turtle.row)
    assert_equal(@initial_col, @turtle.col)
  end

  test "turtle can go backward against north-east by given units" do
    @turtle.rt(45)
    @turtle.bk(5)
    assert_equal(@initial_row + 5, @turtle.row)
    assert_equal(@initial_col - 5, @turtle.col)
  end

  test "turtle can go backward against east by given units" do
    @turtle.rt(90)
    @turtle.bk(5)
    assert_equal(@initial_row, @turtle.row)
    assert_equal(@initial_col - 5, @turtle.col)
  end

  test "turtle can go backward against south-east by given units" do
    @turtle.rt(135)
    @turtle.bk(5)
    assert_equal(@initial_row - 5, @turtle.row)
    assert_equal(@initial_col - 5, @turtle.col)
  end

  test "turtle can go backward against south by given units" do
    @turtle.rt(180)
    @turtle.bk(5)
    assert_equal(@initial_row - 5, @turtle.row)
    assert_equal(@initial_col, @turtle.col)
  end

  test "turtle can go backward against south-west by given units" do
    @turtle.lt(135)
    @turtle.bk(5)
    assert_equal(@initial_row - 5, @turtle.row)
    assert_equal(@initial_col + 5, @turtle.col)
  end

  test "turtle can go backward against west by given units" do
    @turtle.lt(90)
    @turtle.bk(5)
    assert_equal(@initial_row, @turtle.row)
    assert_equal(@initial_col + 5, @turtle.col)
  end

  test "turtle can go backward against north-west by given units" do
    @turtle.lt(45)
    @turtle.bk(5)
    assert_equal(@initial_row + 5, @turtle.row)
    assert_equal(@initial_col + 5, @turtle.col)
  end
end