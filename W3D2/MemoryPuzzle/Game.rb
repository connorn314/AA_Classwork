require_relative 'Board.rb'

class Game

    def initialize(size)
        @size = size
        @board = Board.new(size)
        @previous_guess = nil
    end

    def get_guess
        puts "Please enter a valid position 'row' 'col'"
        puts
        position = gets.chomp.split(' ')
        guess = [position[0].to_i, position[1].to_i]
        if position[0].to_i.to_s != position[0] || position[1].to_i.to_s != position[1]
            raise "not a valid position"
        elsif !@board.hidden_position.include?(guess)
            raise "not a valid position"
        elsif position.length != 2
            raise "not a valid position"
        elsif !(0..@size-1).to_a.include?(guess[0]) || !(0..@size-1).to_a.include?(guess[1])
            raise "not a valid position"
        end
        return guess
    end

    def make_guess
        if @previous_guess == nil
            begin
                first_move = self.get_guess
            rescue
                puts "Please select valid and hidden card"
                retry
            end
            @board[first_move].reveal
            @previous_guess = @board[first_move]
            system("clear")
        else
            begin
                second_move = self.get_guess
            rescue
                puts "Please select valid and hidden card"
                retry
            end
            if @board[second_move].face_value == @previous_guess.face_value
                @board[second_move].reveal
                system('clear')
                @board.render
                puts "It's a match!"
                sleep(2)
            else
                @board[second_move].reveal
                @board.render
                sleep(2)
                @board[second_move].hide
                @previous_guess.hide
            end
            @previous_guess = nil
        end
    end

    def play
        system("clear")
        @board.populate
        while !@board.won?
            @board.render
            self.make_guess
            @board.render
            self.make_guess
            system("clear")
        end
        puts "You won!!!!"
    end
end