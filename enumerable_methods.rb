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
      new_object = []
      my_each(object) do |x|
        next unless yield x

        new_object.push(x)
      end
    elsif object.is_a?(Hash)
      new_object = {}
      my_each(object) do |key, value|
        next unless yield [key, value]

        new_object[key] = value
      end
    end
    new_object
  end

  def my_all?(object)
    flag = true
    if object.is_a?(Array)
      my_each(object) do |x|
        next if yield x

        flag = false
        break
      end
    elsif object.is_a?(Hash)
      my_each(object) do |key, value|
        next if yield [key, value]

        flag = false
        break
      end
    end
    flag
  end

  def my_any?(object)
    flag = false
    if object.is_a?(Array)
      my_each(object) do |x|
        next unless yield x

        flag = true
        break
      end
    elsif object.is_a?(Hash)
      my_each(object) do |key, value|
        next unless yield [key, value]

        flag = true
        break
      end
    end
    flag
  end

  def my_none?(object)
    flag = true
    if object.is_a?(Array)
      my_each(object) do |x|
        next unless yield x

        flag = false
        break
      end
    elsif object.is_a?(Hash)
      my_each(object) do |key, value|
        next unless yield [key, value]

        flag = false
        break
      end
    end
    flag
  end
end


test = [1,343,3,4,600,1]
testhash = {
    jaws: "hey",
    gadfs: "hey1121",
    rrr: "hey1212100000"
}

testhashnumbers = {
  a: 1,
  b: 2,
  c: 200,
  d: 600
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


a = my_select(test){|x| x < 3}
b = test.select{|x| x < 3}
p a,b

c = my_select(testhash){|key, value| value == "hey" || key == :rrr}
d = testhash.select{|key, value| value == "hey" || key == :rrr }
p  c,d

a = my_all?(test){|x| x > 500}
b = test.all?{|x| x > 500}
p a,b

c = my_all?(testhashnumbers){|key, value| value < 500}
d = testhashnumbers.all?{|key, value| value < 500}
p 'hash',c,d


a = my_any?(test){|x| x > 500}
b = test.any?{|x| x > 500}
p a,b

c = my_any?(testhashnumbers){|key, value| value > 800}
d = testhashnumbers.any?{|key, value| value > 800}
p 'hash',c,d
=end

a = my_none?(test){|x| x > 800}
b = test.none?{|x| x > 800}
p a,b

c = my_none?(testhashnumbers){|key, value| value > 500}
d = testhashnumbers.none?{|key, value| value > 500}
p 'hash',c,d