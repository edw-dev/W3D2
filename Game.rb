require_relative "./Board.rb"
require_relative "./HumanPlayer.rb"
require_relative "./ComputerPlayer.rb"
require "byebug"

class Game
    def initialize(is_computer)
        @board = Board.new
        @previous_guess = nil
        if is_computer
            @player = ComputerPlayer.new 
        else
            @player = HumanPlayer.new
        end
    end

    def play
        @board.populate

        while !@board.won?
            system("clear")
            @board.render
            pos = @player.prompt
            self.make_guess(pos)
        end
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
                system("clear")
                @board.render
                puts "Try again! :-b"
                sleep(2)
                @board[pos].hide
                @previous_guess.hide
            end
            @previous_guess = nil
        end          
    end
end

# g = Game.new
# g.play

