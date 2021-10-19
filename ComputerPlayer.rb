class ComputerPlayer

    def initialize
        @known_cards = Hash.new {|h,k| h[k] = []}
        @matched_cards = []
        @num_turns = 0
        @last_flip = nil
    end

    def receive_revealed_card(pos, val)
        @known_cards[val] << pos
        if @known_cards[val].length == 2
            receive_match(val) 
            @known_cards.delete(val)
        end
    end

    def receive_match(val)
        @matched_cards += @known_cards[val]
    end

    def prompt
        @num_turns += 1
        
        if !@matched_cards.empty? && @num_turns % 2 == 0
            return @matched_cards.shift
        else
            
        end
    end
end