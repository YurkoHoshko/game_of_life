class Cell
  attr_reader :x, :y, :alive

  def initialize(x, y, alive = false)
    @x = x
    @y = y
    @alive = alive
  end
end
