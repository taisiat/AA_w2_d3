require "byebug"

class HumanPlayer
    attr_reader :mark
    
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        begin
            puts "Player #{self.mark}, enter a row col position as two numbers with a space, ex) 0 0"
            input = gets.chomp.split.map {|ele| Integer(ele) }
            
            if input.length != 2
                raise  
            else
                puts "Thanks player #{self.mark}, your entered position is #{input}."
                return input #not getting a function return
            end
        rescue 
            puts "Seems you didn't enter two numbers separated by a space." 
            retry
        end
    end
end

if $PROGRAM_NAME == __FILE__
    player1 = HumanPlayer.new(:O)
    answer = player1.get_position
    p
end