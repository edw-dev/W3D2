class ComputerPlayer

    def initialize
        @known_cards = Hash.new {|h,k| h[k] = []}
        @matched_cards = []
    end

    def receive_revealed_card(pos, val)
        @known_cards[val] << pos
        receive_match(val) if @known_cards[val].length == 2
    end

    def receive_match(val)
        @matched_cards += @known_cards[val]
    end
end