require "minitest/autorun"
require_relative "../lib/playground"

describe Playground do
  before do
    @seed = [[1, 2], [2, 3], [2, 2]]
    @x_axis = 3
    @y_axis = 3
    @playground = Playground.new(@x_axis, @y_axis, @seed)
  end

  describe "#build" do
    it "should return playground of requested size" do
      @playground.x_axis.must_equal @x_axis
      @playground.y_axis.must_equal @y_axis
    end

    it "should consist of array of Cells" do
      assert_kind_of Array, @playground.cells
      assert_kind_of Cell, @playground.cells.first
    end

    it "should set size of Cells array to correct value" do
      @playground.cells.count.must_equal @playground.x_axis * @playground.y_axis
    end

    it "should set initial state of Cells according to seed" do
      cells = @playground.cells.select { |cell| @seed.include?([cell.x, cell.y]) }
      cells.each { |cell| cell.alive.must_equal true }
    end
  end

  describe "#neighbours_of" do
    it "should return array of Cells" do
      cell = @playground.cells.first
      neighbours = @playground.neighbours_of(cell)
      assert_kind_of Cell, neighbours.first
    end
  end
end
