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

  def my_select(object)
    if object.is_a?(Array)
      newObject = Array.new
      my_each(object) do |x|
        next if !yield (x)
        newObject.push(x)
      end
    elsif object.is_a?(Hash)
      newObject = Hash.new
      my_each(object) do |key, value|
        next if !yield [key, value]
        newObject[key] = value
      end
    end
    newObject
  end
end


test = [1,343,3,4,2,1]
testhash = {
    jaws: "hey",
    gadfs: "hey1121",
    rrr: "hey1212100000"
}
#p test.keys.length
include Enumerable
#my_each([1,343,3,4]) {|x| p x}
#my_each(test) {|x, y| p x, y}
=begin
  
rescue => exception
  
end
my_each_with_index(test){|x, index| p x, index}
p "---"
test.each_with_index{|x, index| p x, index}
p "Hash"
testhash.each_with_index{|x, index| p x, index}
p "---"
my_each_with_index(testhash){|x, index| p x, index}
=end

a = my_select(test){|x| x < 3}
b = test.select{|x| x < 3}
p a,b

c = my_select(testhash){|key, value| value == "hey" || key == :rrr}
d = testhash.select{|key, value| value == "hey" || key == :rrr }
p  c,d
