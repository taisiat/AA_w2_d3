require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
    attr_reader :current_player, :players
    attr_writer :current_player
    
    def initialize(n, options_hash) #key is mark, val is boolean (f : human, t: computer), order is turn order
        @players = []
        options_hash.each do |mark, comp| 
            if comp
                @players << ComputerPlayer.new(mark)
            else
                @players << HumanPlayer.new(mark)
            end
        end
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
            @board.place_mark(self.current_player.get_position(@board.legal_positions), self.current_player.mark)
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