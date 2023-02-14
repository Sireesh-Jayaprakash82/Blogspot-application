class Count
    def initialize(input_string)
        @input = input_string
    end
    def count_check
        result = ""
        each_character_array = @input.split("")
        for element in each_character_array.uniq
            count = each_character_array.count element
            result.concat(count.to_s)
        end  
        return result
    end
end


obj = Count.new(gets.chomp())
puts obj.count_check
