# rubocop:disable Metrics/ModuleLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/MethodLength

module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    result = []
    size.times do |i|
      result << yield(to_a[i])
    end
    result
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    size.times do |i|
      yield(to_a[i], i)
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    my_each do |i|
      result << i if yield(i)
    end
    result
  end

  def my_all?(arg = nil)
    if !block_given? && arg.nil?
      my_each do |i|
        return false if i == false || i.nil?
      end
      return true
    end

    if arg.is_a?(Integer)
      my_each do |i|
        return false unless i == arg
      end
    elsif arg.is_a?(Regexp)
      my_each do |i|
        return false unless i =~ arg
      end
    elsif !arg.is_a?(Integer) && !block_given?
      my_each do |i|
        return false unless i.is_a? arg
      end
    else
      my_each do |i|
        return false unless yield(i)
      end
    end
    true
  end

  def my_any?(arg = nil)
    if !block_given? && arg.nil?
      my_each do |i|
        return true if i != false && !i.nil?
      end
      return false
    end

    if arg.is_a?(Regexp)
      my_each do |i|
        return true if i =~ arg
      end
    elsif arg.is_a?(Class)
      my_each do |i|
        return true if i.is_a? arg
      end
    elsif block_given?
      my_each do |i|
        return true if yield(i)
      end
    else
      my_each do |i|
        return true if i == arg
      end
    end
    false
  end

  def my_none?(arg = nil)
    if !block_given? && arg.nil?
      my_each do |i|
        return false unless i == false || i.nil?
      end
      return true
    end

    if arg.is_a?(Integer)
      my_each do |i|
        return false if i == arg
      end
    elsif arg.is_a?(Regexp)
      my_each do |i|
        return false if i =~ arg
      end
    elsif !arg.is_a?(Integer) && !block_given?
      my_each do |i|
        return false if i.is_a? arg
      end
    else
      my_each do |i|
        return false if yield(i)
      end
    end
    true
  end

  def my_count(search_for = nil)
    return length unless !search_for.nil? || block_given?

    count = 0
    if !block_given?
      my_each do |i|
        count += 1 if i == search_for
      end
    else
      my_each do |i|
        count += 1 if yield(i)
      end
    end
    count
  end

  def my_map(proc_given = nil)
    return to_enum unless block_given? || proc_given

    result = []
    my_each do |i|
      operation = block_given? ? yield(i) : proc_given.call(i)
      result << operation
    end
    result
  end

  def my_inject(arg_num = nil, arg_op = nil)
    arg_op = arg_num if arg_op.nil? && arg_num.is_a?(Symbol)
    final_result = to_a[0]

    if !arg_op.nil?
      size.times do |i|
        final_result = i != 0 ? final_result.send(arg_op, to_a[i]) : final_result
      end
      final_result = arg_num.is_a?(Integer) ? final_result.send(arg_op, arg_num) : final_result
      return final_result
    else
      size.times do |i|
        final_result = i != 0 ? yield(final_result, to_a[i]) : final_result
      end
    end
    final_result = arg_num.is_a?(Integer) ? yield(final_result, arg_num) : final_result
  end
end

def multiply_els(arr)
  arr.my_inject do |x, y|
    x * y
  end
end

# rubocop:enable Metrics/ModuleLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/MethodLength
