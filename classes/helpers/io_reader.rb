class IOReader
  class << self
    def read_integer
      gets.chomp.to_i
    end

    def read
      gets.chomp
    end
  end
end
