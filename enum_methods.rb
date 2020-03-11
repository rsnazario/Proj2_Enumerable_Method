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

  def my_map
    return to_enum unless block_given?

    result = []
    my_each do |i|
      result << yield(i)
    end
    result
  end
end
