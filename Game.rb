require_relative "./Board.rb"
require "byebug"
class Game
    def initialize
        @board = Board.new
        @previous_guess = nil
    end

    def play
        @board.populate

        while !@board.won?
            @board.render
            pos = self.prompt
            self.make_guess(pos)
        end
    end

    def prompt
        puts "Please enter the position of the card you'd like to flip (e.g. '2,3')"
        pos = gets.chomp.split(',').map(&:to_i)
    end

    def make_guess(pos)
        if @previous_guess == nil
            @previous_guess = @board[pos]
            @board.reveal(pos)
        else
            @board.reveal(pos)
            if  @board[pos] == @previous_guess.face_value   
                puts "its a match!"
            else
                @board.render
                puts "Try again! :-b"
                @board[pos].hide
                @previous_guess.hide
            end
            @previous_guess = nil
        end          
    end
end

g = Game.new
g.play

