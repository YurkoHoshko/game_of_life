require_relative "cell"

class Playground
  attr_reader :x_axis, :y_axis, :cells

  def initialize(x_axis, y_axis, seed = [])
    @x_axis = x_axis
    @y_axis = y_axis
    @cells = fill_with_cells(seed)
  end

  def neighbours_of(central_cell)
    @cells.select do |cell|
      ((cell.x - central_cell.x).abs == 1 && cell.y == central_cell.y) ||
        ((cell.y - central_cell.y).abs == 1 && cell.x == central_cell.x) ||
        ((cell.x - central_cell.x).abs == 1 && (cell.y - central_cell.y).abs == 1)
    end
  end

  private

  def fill_with_cells(seed)
    [].tap do |cells|
      x_axis.times do |x|
        y_axis.times do |y|
          alive = seed.include?([x, y])
          cells << Cell.new(x, y, alive)
        end
      end
    end
  end
end
