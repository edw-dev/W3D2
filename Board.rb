require_relative "./Card.rb"

class Board

    def initialize
        @grid = Array.new(4) { Array.new(4) }
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

end