# frozen_string_literal: true

# Project 2: Enumerable Methods
module Enumerable
  def my_each(object)
    if object.is_a?(Array)
      object.length.times do |i|
        yield (object[i])
      end
    elsif object.is_a?(Hash)
      object.keys.length.times do |i|
        yield [object.keys[i], object.values[i]]
      end
    end
  end
end

#test = [1,343,3,4]
=begin test = {
    jaws: "hey",
    gadfs: "hey1121",
    rrr: "hey1212100000"
} =end
#p test.keys.length
include Enumerable
#my_each([1,343,3,4]) {|x| p x}
my_each(test) {|x, y| p x, y}


