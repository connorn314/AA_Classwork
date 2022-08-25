require 'byebug'

class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        new_array = []
        self.my_each do |el|
            new_array << el if prc.call(el)
        end
        new_array
    end

    def my_reject(&prc)
        new_array = []
        self.my_each do |el|
            new_array << el if !prc.call(el)
        end
        new_array
    end

    def my_any?(&prc)
        new_array = []
        self.my_each do |el|
            new_array << el if prc.call(el)
        end
        new_array.length > 0
    end

    def my_all?(&prc)
        new_array = []
        self.my_each do |el|
            new_array << el if prc.call(el)
        end
        new_array.length == self.length
    end

    def my_flatten
        # debugger

        new_array = []
    
        self.each do |el| #1 2 3 [4, 5] => 4 5
            if el.is_a?(Array) # true
                new_array += el.my_flatten # [1, 2, 3] + [4, 5]
            else
                new_array << el # [4, 5]
            end
        end

        new_array #[4, 5]
    end

    def my_zip(*args)
        new_array = []
        max = self.length
        args.each do |arg|
            if arg.length < max
                (max - arg.length).times { arg << nil }
            end
        end

        self.each_with_index do |el, i|
            subArray = [el]
            args.each do |arg|
                subArray << arg[i]
            end
            new_array << subArray 
        end
        new_array
    end

    def my_rotate(arg=1)
        # arg ||= 1
        new_array = Array.new(self.length, 0)
        self.each_with_index { |el, i| new_array[i] = el }
    
        #debugger
        if arg > 0
            (arg).times do 
                val = new_array.shift
                new_array.push(val) 
            end
        elsif arg < 0
            arg.abs.times do
                val2 = new_array.pop
                new_array.unshift(val2) 
            end
        end
        new_array
    end

    def my_join(separator = '')
        new_string = ''
        self.each_with_index do |el, i|
            if i < self.length - 1
                new_string += el + separator
            else
                new_string += el
            end
        end
        new_string
    end

    def my_reverse
        new_array = Array.new(0)
        i = self.length - 1
        while i >= 0
            new_array << self[i]
            i -= 1
        end
        new_array
    end
end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]


