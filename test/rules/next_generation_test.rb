require "../test_helper"

describe Rules::NextGeneration do
  describe "#apply_to" do
    it "does not affect playground" do
      playground = Playground.new(3, 3)
      new_playground = Rules::NextGeneration.apply_to(playground)
      new_playground.must_equal playground
    end
  end
end
