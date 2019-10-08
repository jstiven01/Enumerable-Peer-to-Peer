# frozen_string_literal: true

# Project 2: Enumerable Methods
module Enumerable # rubocop:disable Metrics/ModuleLength
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

  def my_count(object)
    count = 0
    if object.is_a?(Array)
      my_each(object) do |x|
        next unless yield x

        count += 1
      end
    elsif object.is_a?(Hash)
      my_each(object) do |key, value|
        next unless yield [key, value]

        count += 1
      end
    end
    count
  end

  def my_map(object, proc = false)
    new_object = []
    my_each(object) do |x|
      if !proc
        new_object.push(yield x)
      else
        new_object.push(proc.call(x))
      end
    end
    new_object
  end

  def my_inject(object, acc = 0)
    my_each(object) do |x|
      acc = yield acc, x
    end
    acc
  end

  def multiply_els(arr)
    my_inject(arr, 1) { |product, x| product * x }
  end
end

include Enumerable
test = [1,343,3,4,600,1]
x = my_count(test){|x| x > 300}
y = test.count{|x| x > 300}
p x,y