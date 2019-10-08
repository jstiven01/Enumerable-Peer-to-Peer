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

  def my_each_with_index(object)
    if object.is_a?(Array)
      object.length.times do |i|
        yield [object[i], i]
      end
    elsif object.is_a?(Hash)
      object.keys.length.times do |i|
        yield [[object.keys[i], object.values[i]], i]
      end
    end
  end
end


test = [1,343,3,4]
testhash = {
    jaws: "hey",
    gadfs: "hey1121",
    rrr: "hey1212100000"
}
#p test.keys.length
include Enumerable
#my_each([1,343,3,4]) {|x| p x}
#my_each(test) {|x, y| p x, y}
my_each_with_index(test){|x, index| p x, index}
p "---"
test.each_with_index{|x, index| p x, index}
p "Hash"
testhash.each_with_index{|x, index| p x, index}
p "---"
my_each_with_index(testhash){|x, index| p x, index}

