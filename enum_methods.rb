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

end