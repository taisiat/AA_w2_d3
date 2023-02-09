require_relative "code"

class Mastermind

    def initialize(n)
        @secret_code = Code.random(n)
    end

    def print_matches(code_inst)
        puts "You got #{@secret_code.num_exact_matches(code_inst)} exact matches."
        puts "You got #{@secret_code.num_near_matches(code_inst)} near matches."
    end

    def ask_user_for_guess
        puts "Enter a code consisting of RGBY"
        input = gets.chomp
        new_code = Code.from_string(input)
        self.print_matches(new_code)
        new_code == @secret_code
    end
end
