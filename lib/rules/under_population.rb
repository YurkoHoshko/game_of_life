module Rules
  class UnderPopulation
    def self.apply_to(playground)
      playground.cells.each do |cell|
        alive_neighbours_count = playground.neighbours_of(cell).count(&:alive)
        cell.die if alive_neighbours_count < 2
      end

      playground
    end
  end
end
