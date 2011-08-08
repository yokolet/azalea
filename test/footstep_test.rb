$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'contest'
require 'footstep'

class FootstepTest < Test::Unit::TestCase

  def setup
    @footstep = Footstep.new(5, 4)
  end

  test "can be initialized with row and col" do
    assert_equal(5, @footstep.row)
    assert_equal(4, @footstep.col)
  end

  test "should return -1 when other footstep has a bigger row" do
    other = Footstep.new(10, 0)
    assert_equal(-1, @footstep <=> other)
  end

  test "should return +1 when other footstep has a smaller row" do
    other = Footstep.new(0, 11)
    assert_equal(+1, @footstep <=> other)
  end

  test "should return -1 when other footstep has the same row and a bigger col" do
    other = Footstep.new(5, 11)
    assert_equal(-1, @footstep <=> other)
  end

  test "should return +1 when other footstep has the same row and a smaller col" do
    other = Footstep.new(5, 1)
    assert_equal(+1, @footstep <=> other)
  end

  test "should return 0 when other footstep has the same row and col" do
    other = Footstep.new(5, 4)
    assert_equal(0, @footstep <=> other)
  end

  test "should return true when the same row and col are given" do
    assert(@footstep.eql?(5, 4))
  end

  test "should return false when different row and/or col are given" do
    assert !(@footstep.eql?(5, 3))
  end
end