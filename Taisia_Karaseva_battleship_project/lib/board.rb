# require "byebug"

class Board
  attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end
  
    def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end  

  def [](indices)
    row, column = indices
    @grid[row][column]
  end

  def []=(position, value)
    row, column = position
    @grid[row][column] = value
  end

  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(position)
    if self[position] == :S
        self[position] = :H
        puts "you sunk my battleship!"
        return true
    else
        self[position] = :X
        return false
    end
  end

#   def place_random_ships
#   indices = []
  
#     (0...Math.sqrt(@size)).each do |row|
#         (0...Math.sqrt(@size)).each do |column|
#             indices << [row, column]
#         end
#     end
#     selected_indices = indices.sample(indices.length / 4.0)
#     selected_indices.each do |coordinates|
#         @grid[coordinates.first][coordinates.last] = :S
#     end
#   end

    def place_random_ships
        ships_needed = 0.25 * @size

        while self.num_ships < ships_needed
            row = rand(0...Math.sqrt(@size))
            column = rand(0...Math.sqrt(@size))
            coordinate = [row, column]
            self[coordinate] = :S
        end
  
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                ele == :S ? :N : ele
            end
        end
    end  

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end


