# exercise 1
def my_each(init, finish, last_included)
    finish -= 1 unless last_included
    
    while init <= finish do
        yield
        init += 1
    end
end

my_each(1, 5, true) do
    puts "Hello world" 
end

# exercise 2

exc2 = Hash.new
    
def my_each_with_index(arr)
    i = 0
    while i < arr.length do
        yield(arr[i], i)
        i += 1
    end
end

my_each_with_index(%w(cat dog fish lion bear human)) do |item, index|
    exc2[item] = index
end
    
puts exc2
