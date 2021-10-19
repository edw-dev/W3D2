require_relative "./Board.rb"
require_relative "./HumanPlayer.rb"
require_relative "./ComputerPlayer.rb"
require "byebug"

class Game
    def initialize
        @board = Board.new
        @previous_guess = nil
        @human_player = HumanPlayer.new
    end

    def play
        @board.populate

        while !@board.won?
            system("clear")
            @board.render
            pos = @human_player.prompt
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

