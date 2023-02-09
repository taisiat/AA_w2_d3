require_relative "board"
require_relative "human_player"

class Game
    attr_reader :current_player, :players
    attr_writer :current_player
    
    def initialize(n, *marks)
        @players = marks.map { |mark| HumanPlayer.new(mark)}
        @current_player = self.players[0]
        @board = Board.new(n)
    end

    def switch_turn
        self.players.rotate!
        @current_player = self.players[0]
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

if $PROGRAM_NAME == __FILE__
    game1 = Game.new(6, :X, :O)
    game1.play
end