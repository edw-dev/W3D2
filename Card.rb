class Card
    attr_reader :face_up, :face_value
    def initialize(value)
        @face_up = false
        @face_value = value
    end
    def hide
        @face_up = false
    end
    def reveal
        @face_up = true
    end
    def to_s
        return @face_value if @face_up
        " "
    end
    def ==(other)
        @face_value == other
    end


end
