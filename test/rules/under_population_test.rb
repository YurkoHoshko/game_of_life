require "../test_helper"

describe Rules::UnderPopulation do
  describe "#apply_to" do
    it "kills cell with less then 2 alive neighours" do
      # A D D
      # D D D
      # D D D
      seed = [[0, 0]]
      playground = Playground.new(3, 3, seed)

      new_playground = Rules::UnderPopulation.apply_to(playground)
      new_playground.cells.first.alive.must_equal false
    end

    it "does not affect cells with 2 or more alive neighours" do
      # A A D
      # A D D
      # D D D
      seed = [[0, 0], [0, 1], [1, 0]]
      playground = Playground.new(3, 3, seed)

      new_playground = Rules::UnderPopulation.apply_to(playground)
      new_playground.cells.first.alive.must_equal true
    end
  end
end
