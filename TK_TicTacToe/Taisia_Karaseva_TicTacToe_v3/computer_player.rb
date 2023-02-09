class ComputerPlayer
    
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(options)
        choice = options.sample
        puts "The computer played #{self.mark} at position #{choice}."
        choice
    end

end