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

  def my_all?(obj = nil) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    if block_given? 
      my_each do |x|
        next if yield x

        return false
      end
    elsif !obj
      my_each do |x|
        next if x

        return false
      end
    elsif obj.is_a? (Regexp)
      my_each do |x|
        next if x.match(obj)

        return false
      end
    elsif obj.class == Class
      my_each do |x|
        next if x.is_a?(obj)

        return false
      end
    else
      my_each do |x|
        next if x == obj

        return false
      end
    end
    true
  end

  def my_any?(obj = nil) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    if block_given? 
      my_each do |x|
        next unless yield x

        return true
      end
    elsif !obj
      my_each do |x|
        next unless x

        return true
      end
    elsif obj.is_a? (Regexp)
      my_each do |x|
        next if x.match(obj) == nil

        return true
      end
    elsif obj.class == Class
      my_each do |x|
        next unless x.is_a?(obj)

        return true
      end
    else
      my_each do |x|
        next unless x == obj

        return true
      end
    end
    false
  end

  def my_none?(obj = nil)
    
    if block_given? 
      my_each do |x|
        next unless yield x

        return false
      end
    elsif !obj
      my_each do |x|
        next unless x

        return false
      end
    elsif obj.is_a? (Regexp)
      my_each do |x|
        next if x.match(obj) == nil

        return false
      end
    elsif obj.class == Class
      my_each do |x|
        next unless x.is_a?(obj)

        return false
      end
    else
      my_each do |x|
        next unless x == obj

        return false
      end
    end
    true
  end

  def my_count(number = nil)
    count = 0
    if block_given?
      my_each do |x|
        count += 1 if yield(x)
      end
    elsif number
      my_each do |x|
        count += 1 if x == number
      end
    else
      count = length
    end
    count
  end

  def my_map
    return to_enum unless block_given?

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

  def my_inject(parm1 = nil, parm2 = nil) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    if block_given? && parm1
      acc = parm1
      my_each { |element| acc = yield(acc, element) }
    elsif block_given? && !parm1
      acc = self[0]
      my_each_with_index do |element, index|
        acc = yield(acc, element) unless index.zero?
      end
    elsif !parm2
      acc = self[0]
      operation = parm1.to_proc
      my_each_with_index do |element, index|
        acc = operation.call(acc, element) unless index.zero?
      end
    else
      acc = parm1
      operation = parm2.to_proc
      my_each { |element| acc = operation.call(acc, element) }
    end
    acc
  end

  def multiply_els(arr)
    arr.my_inject { |product, x| product * x }
  end
end



#my_all
#my_all
#true_array = [1, true, 'hi', []]
#puts true_array.all?
#puts true_array.my_all?
#array = [7, 8, 1, 4, 5, 0, 8, 4, 7, 6, 7, 8, 4, 8, 8, 6, 8, 0, 1, 7, 0, 2, 6, 6, 3, 1, 6, 6, 8, 5, 0, 2, 3, 7, 8, 7, 1, 5, 4, 4, 5, 1, 3, 5, 8, 7, 3, 3, 0, 0, 4, 1, 6, 2, 0, 4, 2, 1, 8, 3, 3, 6, 0, 8, 4, 4, 1, 6, 4, 6, 5, 3, 6, 6, 8, 6, 8, 7, 0, 6, 6, 2, 8, 8, 2, 1, 8, 5, 0, 5, 0, 3, 6, 4, 5, 8, 3, 3, 2, 1]
#puts array.all?(Integer)
#puts array.my_all?(Integer)
#words = %w[dog door rod blade]
#puts words.all?(/d/)
#puts words.my_all?(/d/)
#puts array.all?(3)
#puts array.my_all?(3)


#my_any
#array = [7, 8, 1, 4, 5, 0, 8, 4, 7, 6, 7, 8, 4, 8, 8, 6, 8, 0, 1, 7, 0, 2, 6, 6, 3, 1, 6, 6, 8, 5, 0, 2, 3, 7, 8, 7, 1, 5, 4, 4, 5, 1, 3, 5, 8, 7, 3, 3, 0, 0, 4, 1, 6, 2, 0, 4, 2, 1, 8, 3, 3, 6, 0, 8, 4, 4, 1, 6, 4, 6, 5, 3, 6, 6, 8, 6, 8, 7, 0, 6, 6, 2, 8, 8, 2, 1, 8, 5, 0, 5, 0, 3, 6, 4, 5, 8, 3, 3, 2, 1]
#true_block = proc { |num| num <= 3 }
#puts array.any?(&true_block)
#puts array.my_any?(&true_block)
#true_array = [nil, false, true, []]
#puts true_array.any?
#puts true_array.my_any?
#puts array.any?(Integer)
#puts array.my_any?(Integer)
#words = ["dog", "door", "rod", "blade"]
#puts words.any?(/z/)
#puts words.my_any?(/z/)
#words[0] = 'cat'
#puts words.any?('cat')
#puts words.my_any?('cat')

#my_none
false_array = [nil, false, nil, false]
puts false_array.none?
puts false_array.my_none?
array = [7, 8, 1, 4, 5, 0, 8, 4, 7, 6, 7, 8, 4, 8, 8, 6, 8, 0, 1, 7, 0, 2, 6, 6, 3, 1, 6, 6, 8, 5, 0, 2, 3, 7, 8, 7, 1, 5, 4, 4, 5, 1, 3, 5, 8, 7, 3, 3, 0, 0, 4, 1, 6, 2, 0, 4, 2, 1, 8, 3, 3, 6, 0, 8, 4, 4, 1, 6, 4, 6, 5, 3, 6, 6, 8, 6, 8, 7, 0, 6, 6, 2, 8, 8, 2, 1, 8, 5, 0, 5, 0, 3, 6, 4, 5, 8, 3, 3, 2, 1]
puts array.none?(String)
puts array.my_none?(String)
words = %w[dog door rod blade]
puts words.none?(/z/)
puts words.my_none?(/z/)
words[0] = 5
puts words.none?(5)
puts words.my_none?(5)
=begin
#my_count
array = [7, 8, 1, 4, 5, 0, 8, 4, 7, 6, 7, 8, 4, 8, 8, 6, 8, 0, 1, 7, 0, 2, 6, 6, 3, 1, 6, 6, 8, 5, 0, 2, 3, 7, 8, 7, 1, 5, 4, 4, 5, 1, 3, 5, 8, 7, 3, 3, 0, 0, 4, 1, 6, 2, 0, 4, 2, 1, 8, 3, 3, 6, 0, 8, 4, 4, 1, 6, 4, 6, 5, 3, 6, 6, 8, 6, 8, 7, 0, 6, 6, 2, 8, 8, 2, 1, 8, 5, 0, 5, 0, 3, 6, 4, 5, 8, 3, 3, 2, 1]
puts array.count
puts array.my_count
puts array.count(3)
puts array.my_count(3)
puts array.count { |x| x%2 == 0 }
puts array.my_count { |x| x%2 == 0 }
#my_map
array = [7, 8, 1, 4, 5, 0, 8, 4, 7, 6, 7, 8, 4, 8, 8, 6, 8, 0, 1, 7, 0, 2, 6, 6, 3, 1, 6, 6, 8, 5, 0, 2, 3, 7, 8, 7, 1, 5, 4, 4, 5, 1, 3, 5, 8, 7, 3, 3, 0, 0, 4, 1, 6, 2, 0, 4, 2, 1, 8, 3, 3, 6, 0, 8, 4, 4, 1, 6, 4, 6, 5, 3, 6, 6, 8, 6, 8, 7, 0, 6, 6, 2, 8, 8, 2, 1, 8, 5, 0, 5, 0, 3, 6, 4, 5, 8, 3, 3, 2, 1]
puts array.map
puts array.my_map
print array.map { |n| n * 2 }
print array.my_map { |n| n * 2 }
#my_inject
range = Range.new(5, 50)
puts range.inject(4) { |prod, n| prod * n }
puts range.my_inject(4) { |prod, n| prod * n }
array = [7, 8, 1, 4, 5, 0, 8, 4, 7, 6, 7, 8, 4, 8, 8, 6, 8, 0, 1, 7, 0, 2, 6, 6, 3, 1, 6, 6, 8, 5, 0, 2, 3, 7, 8, 7, 1, 5, 4, 4, 5, 1, 3, 5, 8, 7, 3, 3, 0, 0, 4, 1, 6, 2, 0, 4, 2, 1, 8, 3, 3, 6, 0, 8, 4, 4, 1, 6, 4, 6, 5, 3, 6, 6, 8, 6, 8, 7, 0, 6, 6, 2, 8, 8, 2, 1, 8, 5, 0, 5, 0, 3, 6, 4, 5, 8, 3, 3, 2, 1]
puts array.inject(:+)
puts array.my_inject(:+)
=end
p ".."