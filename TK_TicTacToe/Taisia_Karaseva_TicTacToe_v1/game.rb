require_relative "board"
require_relative "human_player"

class Game
    attr_reader :player_one, :player_two, :current_player
    attr_writer :current_player
    
    def initialize(player_one_mark, player_two_mark)
        @player_one = HumanPlayer.new(player_one_mark)
        @player_two = HumanPlayer.new(player_two_mark)
        @current_player = self.player_one
        @board = Board.new
    end

    def switch_turn
        if self.current_player == self.player_one
            self.current_player = self.player_two
        elsif
            self.current_player == self.player_two
            self.current_player = self.player_one
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(self.current_player.get_position, self.current_player.mark)
            if @board.win?(self.current_player.mark)
                puts "VICTORY for player #{self.current_player.mark}! The game is over."
                return
            else
                self.switch_turn
            end
        end
        puts "DRAW, no one has won. Do better."
    end

end