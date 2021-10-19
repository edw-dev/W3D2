require_relative "./Board.rb"

class Game
    def initialize
        @board = Board.new
        @last_guess = nil
    end

    def play
        @board.populate

        while !@board.won?
            @board.render
            @board.reveal(self.prompt)
        end
    end

    def prompt
        puts "Please enter the position of the card you'd like to flip (e.g. '2,3')"
        pos = gets.chomp.split(',')
    end

    def make_guess(pos)
        i = 0
        while i < 2
            @last_guess = @board[pos] if @last_guess == nil
            i += 1
        end
    end
end