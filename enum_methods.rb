module Enumerable
  def my_each2
    return to_enum unless block_given?

    size.times do |i|
      yield(to_a[i])
    end
  end

  def my_each_with_index
    return to_enum unless block_given?

    size.times do |i|
      yield(to_a[i], i)
    end
  end

  def my_select
    return to_enum unless block_given?

    result = []
    my_each do |i|
      result << i if yield(i)
    end
    result
  end

  def my_all?
    return to_enum unless block_given?

    my_each do |i|
      return false unless yield(i)
    end
    true
  end

  def my_any?
    return to_enum unless block_given?

    my_each do |i|
      return true if yield(i)
    end
    false
  end

  def my_none?
    return to_enum unless block_given?

    my_each do |i|
      return false if yield(i)
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

  def my_map2(proc_given = nil)
    return to_enum unless block_given? || proc_given

    result = []
    my_each do |i|
      operation = block_given? ? yield(i) : proc_given.call(i)
      result << operation
    end
    result
  end

  def my_inject
    return to_enum unless block_given?

    final_result = to_a[0]
    size.times do |i|
      final_result = i != 0 ? yield(final_result, to_a[i]) : final_result
    end
    final_result
  end
end

def multiply_els(arr)
  arr.my_inject do |x, y|
    x * y
  end
end
