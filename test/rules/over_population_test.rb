require_relative "../test_helper"

describe Rules::OverPopulation do
  describe "#apply_to" do
    before do
      @seed = [
        [0, 0], [0, 1], [0, 2],
        [1, 0], [1, 1], [1, 2]
      ]
      @playground = Playground.new(3, 3, @seed)
    end

    it "should apply to cells, that have more then three neighbours" do
      new_playground = Rules::OverPopulation.apply_to(@playground)
      dead_cell = new_playground.cells.detect { |c| c.x == 0 && c.y == 1 }
      dead_cell.alive.must_equal false
    end
  end
end
