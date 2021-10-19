require_relative "./Card.rb"
require "byebug"
class Board

    def initialize
        @grid = Array.new(4) { Array.new(4) }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end
    def []=(pos,val)
        row, col = pos
        @grid[row][col] = val
    end
    def populate
        potential_card_values = ('a'..'h').to_a.map(&:upcase)
        potential_card_values.each do |value|
            i = 0
            while i < 2 do 
                card = Card.new(value)
                row_idx = rand(0..3)
                col_idx = rand(0..3)
                if @grid[row_idx][col_idx] == nil
                    @grid[row_idx][col_idx] = card
                    i += 1
                end
            end
        end
    end
    def render
        render = [[" ","0","1","2","3"],["0"],["1"],["2"],["3"]]
        @grid.each_with_index do |row, row_idx|
            row.each do |ele|
                render[row_idx + 1] << ele.to_s
            end

        end 
        render.each {|row| puts row.join(" ")}
    end
    def won?
        @grid.flatten.all? {|card| card.face_up}
    end
    def reveal(guess_pos)
        self[guess_pos].reveal
        self[guess_pos].face_value  
    end

end

# b = Board.new
# b.populate
# b.render
# puts b.won?