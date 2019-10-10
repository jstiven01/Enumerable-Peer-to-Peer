# frozen_string_literal: true

# Project 2: Enumerable Methods
module Enumerable # rubocop:disable Metrics/ModuleLength
  def my_each
    return self.to_enum if !block_given?
    length.times do |i|
      yield (self[i])
    end
  end
 
  def my_each_with_index
    return self.to_enum if !block_given?
    length.times do |i|
      yield [self[i], i]
    end
  end
=begin
  def my_select
    if self.is_a?(Array)
      new_self = []
      my_each do |x|
        next unless yield x

        new_self.push(x)
      end
    elsif self.is_a?(Hash)
      new_self = {}
      my_each do |key, value|
        next unless yield [key, value]

        new_self[key] = value
      end
    end
    new_self
  end

  def my_all?
    flag = true
    if self.is_a?(Array)
      my_each do |x|
        next if yield x

        flag = false
        break
      end
    elsif self.is_a?(Hash)
      my_each do |key, value|
        next if yield [key, value]

        flag = false
        break
      end
    end
    flag
  end

  def my_any?
    flag = false
    if self.is_a?(Array)
      my_each do |x|
        next unless yield x

        flag = true
        break
      end
    elsif self.is_a?(Hash)
      my_each do |key, value|
        next unless yield [key, value]

        flag = true
        break
      end
    end
    flag
  end

  def my_none?
    flag = true
    if self.is_a?(Array)
      my_each do |x|
        next unless yield x

        flag = false
        break
      end
    elsif self.is_a?(Hash)
      my_each do |key, value|
        next unless yield [key, value]

        flag = false
        break
      end
    end
    flag
  end

  def my_count
    count = 0
    if self.is_a?(Array)
      my_each do |x|
        next unless yield x

        count += 1
      end
    elsif self.is_a?(Hash)
      my_each do |key, value|
        next unless yield [key, value]

        count += 1
      end
    end
    count
  end

  def my_map(self, proc = false)
    new_self = []
    my_each do |x|
      if !proc
        new_self.push(yield x)
      else
        new_self.push(proc.call(x))
      end
    end
    new_self
  end

  def my_inject(self, acc = 0)
    my_each do |x|
      acc = yield acc, x
    end
    acc
  end

  def multiply_els(arr)
    my_inject(arr, 1) { |product, x| product * x }
  end 
=end
end

include Enumerable
test = [1,343,3,4,600,1]
#test.length.times do |x|
#  p test[x]
#  end
#p test.my_each
test.my_each_with_index{|x, i| print x, "-", i," "}
