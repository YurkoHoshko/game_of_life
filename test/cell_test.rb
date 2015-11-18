require_relative "./test_helper"

describe Cell do
  before do
    @x = 1
    @y = 1
    @alive = true
    @cell = Cell.new(@x, @y, @alive)
  end

  describe "#new" do
    it "should initialize Cell with correct values" do
      @cell.x.must_equal @x
      @cell.y.must_equal @y
      @cell.alive.must_equal @alive
    end
  end

  describe "#die" do
    it "should set alive attribute to false" do
      @cell.die
      @cell.alive.must_equal false
    end
  end

  describe "#reproduce" do
    it "should set alive attribute to true" do
      @cell.reproduce
      @cell.alive.must_equal true
    end
  end
end
