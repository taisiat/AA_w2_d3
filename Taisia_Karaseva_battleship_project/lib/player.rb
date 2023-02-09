class Player

    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        inputs = gets.chomp
        answer = inputs.split.map(&:to_i)
    end
end
