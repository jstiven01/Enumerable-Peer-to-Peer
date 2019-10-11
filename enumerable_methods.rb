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
    elsif obj.is_a? Regexp
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
    elsif obj.is_a? Regexp
      my_each do |x|
        next if x.match(obj).nil?

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

  def my_none?(obj = nil) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
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
    elsif obj.is_a? Regexp
      my_each do |x|
        next if x.match(obj).nil?

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
    arr = to_a
    if block_given? && parm1
      acc = parm1
      arr.my_each { |element| acc = yield(acc, element) }
    elsif block_given? && !parm1
      acc = self[0]
      arr.my_each_with_index do |element, index|
        acc = yield(acc, element) unless index.zero?
      end
    elsif !parm2
      acc = self[0]
      operation = parm1.to_proc
      arr.my_each_with_index do |element, index|
        acc = operation.call(acc, element) unless index.zero?
      end
    else
      acc = parm1
      operation = parm2.to_proc
      arr.my_each { |element| acc = operation.call(acc, element) }
    end
    acc
  end

  def multiply_els(arr)
    arr.my_inject { |product, x| product * x }
  end
end
