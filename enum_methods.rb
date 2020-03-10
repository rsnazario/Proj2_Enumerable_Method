module Enumerable
    
  def my_each
    return to_enum unless block_given?
    self.length.times do |i|
        yield(self[i])
    end
    return self
  end

  def my_each_with_index
    return to_enum unless block_given?
    self.length.times do |i|
        yield(self[i], i)
    end
    return self
  end
  
  def my_select
    return to_enum unless block_given?
    result = []
    my_each do |i|
        result << i if yield(i)
    end
    return result
  end

  def my_all?
    return to_enum unless block_given?
    my_each do |i|
      return false unless yield(i)
    end
    return true
  end

  def my_any?
    return to_enum unless block_given?
    my_each do |i|
        return true if yield(i)
    end
    return false
  end

  def my_none?
    return to_enum unless block_given?
    my_each do |i|
        return false if yield(i)
    end
    return true
  end
  
end