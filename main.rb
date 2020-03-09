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

# exercise 3

def my_select (arr, last_included)
    aux = []
    i = 0
    j = arr.length
    while i < j do
        if yield(arr[i])
            aux << arr[i]
        end
        i += 1
    end
        return aux
end

result = my_select( [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] , true) do |x|
    x.even?
end

print result
