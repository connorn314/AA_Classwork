require_relative 'Card.rb'
class Board

    def initialize(size)
        raise "Board needs even number for size" if size % 2 != 0 || size > 7 || size < 1
        @grid = Array.new(size){Array.new(size, nil)}
        @size = size * size
    end

    def [](position)
        @grid[position[0]][position[1]]
    end 

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def valid?(postion)
        if self[position] != nil
            return false
        end
        true
    end
    def available_position
        empty = []
        @grid.each_with_index do |row, idx1|
            row.each_with_index do |ele, idx2|
                if ele == nil
                    empty << [idx1, idx2]
                end
            end
        end
        empty
    end

    def hidden_position
        empty = []
        @grid.each_with_index do |row, idx1|
            row.each_with_index do |ele, idx2|
                if ele.face_down == true
                    empty << [idx1, idx2]
                end
            end
        end
        empty
    end

    def pair_num
        @size/2
    end

    def populate
        alphabet = ("A".."Z").to_a
        #debugger
        self.pair_num.times do    
            value = alphabet.sample
            2.times do
                card_1 = Card.new(value)
                position = self.available_position.sample
                self[position] = card_1
            end
            get_rid_of = alphabet.index(value)
            alphabet.delete_at(get_rid_of)
        end
    end

    def render 
        top_row = "  "
        (0...@grid.length).each do |i|
            if i < @grid.length - 1 
                top_row += i.to_s + " "
            else
                top_row += i.to_s
            end
        end
        puts top_row
        @grid.each_with_index do |row, idx1|
            rows = ""
            rows += idx1.to_s + " "
            row.each_with_index do |ele, idx2|
                if ele.face_down == false
                    rows += ele.face_value + " "
                else
                    rows += "  "
                end
            end
            puts rows
        end
    end

    def won?
        @grid.each do |row|
            return false if row.any? {|ele| ele.face_down == true}
        end
        true
    end

    def reveal(guessed_position)
        pos = guessed_position
        if self[pos].face_down == true
            self[pos].reveal
            return self[pos].face_value
        end
    end
end