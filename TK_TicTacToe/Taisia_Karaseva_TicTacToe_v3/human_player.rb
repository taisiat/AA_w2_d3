require "byebug"

class HumanPlayer
    attr_reader :mark
    
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(options)
        puts "Player #{self.mark}, enter a row col position as two numbers with a space, ex) 0 0"
        input = gets.chomp.split.map {|ele| Integer(ele) }
        if !options.include?(input)
            puts "Player #{self.mark}, that is not a legal option, please enter another"
            self.get_position(options)
        else
            puts "Thanks player #{self.mark}, your entered position is #{input}."
            return input
        end
    end
end

if $PROGRAM_NAME == __FILE__
    player1 = HumanPlayer.new(:O)
    answer = player1.get_position
    p
end