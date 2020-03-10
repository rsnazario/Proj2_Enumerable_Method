module Enumerable
    
  def my_each
      return to_enum unless block_given?
      self.length.times do
          yield
      end
      
  end


end