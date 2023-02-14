class Number_Evaluation

    def initialize(number_1)
        @num1 = number_1
    end

    def evaluate
        result = @num1 / 2
        if @num1 == result * 2
            return "Even"
        else
            return "Odd"
        end                 
    end
end


obj = Number_Evaluation.new(gets.chomp().to_i)
puts obj.evaluate