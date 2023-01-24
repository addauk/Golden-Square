class StringRepeater

    def initialize(io)
      @io = io
    end

    def run 

      @io.puts "Hello. I will repeat a string many times."
      @io.puts "Please enter a string"
      repeatable = @io.gets.chomp
      @io.puts "Please enter a number of repeats"
      times = get_number
      @io.puts "Here is your result:"
      @io.puts repeatable * times

    end

    private

    def get_number
      response = @io.gets
      return response.to_i if response.to_i.to_s == response && response.to_i.positive?
      fail "You must enter a positive number"
    end

end
