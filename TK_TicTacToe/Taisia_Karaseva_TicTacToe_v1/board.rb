class Board
    attr_reader :grid
    
    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid?(position)
        position.all? { |coordinate| coordinate < 3 && coordinate >= 0}
    end

    def [](position)
        row, column = position
        @grid[row][column]
    end

    def []=(position, value)
        row, column = position
        @grid[row][column] = value
    end

    def empty?(position)
        if self.valid?(position)
            return self[position] == "_"
        else
            raise "This is not a valid position"
        end
    end

    def place_mark(position, mark)
        if self.valid?(position) && self.empty?(position)
            self[position] = mark
        else
            raise "This isn't a valid move"
        end
    end

    def print
        self.grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        self.grid.any? {|row| row.join == mark.to_s * 3}
    end

    def win_col?(mark)
        self.grid.transpose.any? {|column| column.join == mark.to_s * 3}
    end

    # def win_diagonal?(mark)
    #     diagonal_down = ""
    #     diagonal_up = ""
    #     center = (self.grid.length - 1) / 2.0
    #     (0...@grid.length).each do |row_idx|
    #         (0...@grid.length).each do |column_idx|
    #             ele = self[[row_idx, column_idx]]
    #             if row_idx == column_idx && ele == mark
    #                 diagonal_down += ele.to_s
    #             end
    #             if row_idx + column_idx == self.grid.length - 1 && (row_idx != column_idx || (row_idx == center && column_idx == center)) && ele == mark
    #                 diagonal_up += ele.to_s
    #             end
    #         end
    #     end
    #     diagonal_down == mark.to_s * self.grid.length || diagonal_up == mark.to_s * self.grid.length
    # end

    def win_diagonal?(mark)
        down_win = 0
        up_win = 0
        (0...@grid.length).each do |row_idx|
            if self[[row_idx, row_idx]] == mark
                down_win += 1
            end
            if self[[row_idx, self.grid.length - 1 - row_idx]] == mark
                up_win += 1
            end
        end
        down_win == self.grid.length || up_win == self.grid.length
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    def empty_positions?
        self.grid.flatten.count("_") > 0
    end
end

if $PROGRAM_NAME == __FILE__
    b = Board.new
    # b.place_mark([-1, 2], :X) # this should fail
    p b.place_mark([1, 2], :X) 
    p b
    # b.place_mark([1, 3], :X)
    p b.place_mark([0, 0], :O)
    p b
    # b.place_mark([0, 0], :X)
    p b.win?(:X)
    b.place_mark([2, 0], :X)
    b.place_mark([1, 1], :X)
    b.place_mark([0, 2], :X)
    p b
    p b.win?(:X)
end