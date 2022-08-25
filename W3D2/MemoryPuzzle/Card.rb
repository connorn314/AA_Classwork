class Card
    attr_reader :face_down, :face_value
    def initialize(face_value)
        @face_value = face_value
        @face_down = true
    end

    def display_info
        if !@face_down
            return @face_value
        end
    end

    def hide
        @face_down = true
    end

    def reveal
        @face_down = false
    end

    def to_s(value)
        value.to_s
    end

    # def ==(card)
    #     self.face_value == card.face_value
    # end
end
