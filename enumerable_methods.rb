# frozen_string_literal: true

# Project 2: Enumerable Methods
module Enumerable
    def my_each
      # your code here
      if self.is_a?(Array)
        (self.length).times do |i|
            yield (self[i])
        end
      elsif self.is_a?(Hash)
        (self.keys.length).times do |i|
          yield [self.keys[i], self.values[i]]
        end
      end
    end
end

test = [1,343,3,4]
#test = {
#    jaws: "hey",
#    gadfs: "hey1121",
#    rrr: "hey1212100000"
#}
#p test.keys.length
test.my_each {|x| p x}
#test.my_each {|x, y| p x, y}


