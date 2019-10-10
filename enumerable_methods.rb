# frozen_string_literal: true

# Project 2: Enumerable Methods
module Enumerable # rubocop:disable Metrics/ModuleLength
  def my_each
    return to_enum unless block_given?

    length.times do |i|
      yield (self[i])
    end
  end

  def my_each_with_index
    return to_enum unless block_given?

    length.times do |i|
      yield [self[i], i]
    end
  end

  def my_select
    return to_enum unless block_given?

    new_self = []
    my_each do |x|
      next unless yield x

      new_self.push(x)
    end
    new_self
  end

  def my_all?
    flag = true
    return flag unless block_given?

    my_each do |x|
      next if yield x

      flag = false
      break
    end
    flag
  end

  def my_any?
    flag = false
    return !flag unless block_given?

    my_each do |x|
      next unless yield x

      flag = true
      break
    end
    flag
  end

  def my_none?
    flag = true
    return !flag unless block_given?

    my_each do |x|
      next unless yield x

      flag = false
      break
    end
    flag
  end

  def my_count(number = nil)
    return length unless (block_given? || !number.nil?)

    count = 0
    my_each do |x|
      if !number.nil? && number == x || block_given? && yield(x)
        count += 1
      end
    end
    count
  end

  def my_map
    return to_enum unless (block_given?)

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

  def my_inject
    acc = self[0]
    (length-1).times do |i|
      acc = yield acc, self[i+1]
    end
    acc
  end

  def multiply_els(arr)
    arr.my_inject { |product, x| product * x }
  end 

end

include Enumerable
test = [1,343,3,4,600,1]
#test.length.times do |x|
#  p test[x]
#  end
#p test.my_each
#test.my_each_with_index{|x, i| print x, "-", i," "}

#a = test.my_select
#b = test.select
#p a,b

#a = test.my_all?{|x| x > 500}
#b = test.all?{|x| x > 500}
#p a,b

#a = test.my_any?
#b = test.any?
#p a,b

#a = test.my_none?
#b = test.none?
#p a,b

#a = test.my_count
#b = test.count
#p a,b
#newProc = Proc.new {|x| x + 5}
#a = test.my_map(&newProc)
#b = test.map(&newProc)
#p a,b

#a = test.my_inject{|sum, x|  x + sum}
#b = test.inject(:+){|sum, x|  x + sum}
#p  b

#p multiply_els(test)
#p test.inject{|prod, x| prod * x}