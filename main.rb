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

exc3 = my_select( [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] , true) do |x|
    x.even?
end

print exc3

# exercise 4

def my_all? (arr)
    aux = []
    i = 0
    j = arr.length
    while i < j do
        if !yield(arr[i])
            return false
        end
        i += 1
    end
    return true
end

exc4_a = my_all?(%w[ant bear cat]) do |word|
    word.length > 3
end

exc4_b = my_all?(%w[lion bear fish]) do |word|
    word.length > 3
end

puts exc4_a
puts exc4_b


# exercise 5

def my_any? (arr)
    if arr.length == 0
        return false
    end
    i = 0
    while i < arr.length do
        if !yield(arr[i])
            return false
        end
        i += 1
    end
    return true
end

exc5_a = my_any?(%w[ant bear cat]) do |word|
    word.length > 3
end

exc5_b = my_any?(%w[lion bear fish]) do |word|
    word.length > 3
end

exc5_c = my_any?([]) do |word|
    word.length > 3
end
   
puts exc5_a
puts exc5_b
puts exc5_c

# exercise 6

def my_none? (arr)
    if arr.length == 0 
        return true
    end
    i = 0
    while i < arr.length do
        if yield(arr[i])
            return false
        end
        i+=1
    end
    return true
end

exc6_a = my_none?(%w[cat ant bear]) do |word|
    word.length == 5
end

exc6_b = my_none?(%w[cat ant bear]) do |word|
    word.length >= 4
end
exc6_c = my_none?([]) do |word|
    word.length > 1
end

puts exc6_a
puts exc6_b
puts exc6_c

# exercise 7

def my_count(arr, search = nil)
    return 0 if arr.length == 0
    return arr.length if search.nil?
    i = 0 
    counter = 0
    while i < arr.length do 
        if arr[i] == search
            counter += 1
        end
        i += 1
    end
    return counter
end


exc7_a = my_count([1, 2, 3, 2, 5, 6, 2, 8, 2], 2)
exc7_b = my_count([])
exc7_c = my_count([1, 2, 3, 4, 5, 6, 7])

puts exc7_a
puts exc7_b
puts exc7_c

# exercise 8

def my_map(init, finish, last_included = true)
    aux = []
    finish -= 1 unless last_included
    while init <= finish do
        aux << yield(init)
        init += 1
    end
    return aux
end

exc8_a = my_map(1, 4, true) do |i|
    i*i
end

exc8_b = my_map(1, 4, true) do |word|
    "cat"
end

print exc8_a 
puts
print exc8_b
puts


# exercise 9

def my_inject(init, finish, last_included = true)
    aux = 0
    # deals with multiplication, setting the initial value to 1
    aux = 1 if yield(0, init) == 0
    finish -= 1 unless last_included
    while init <= finish do
        aux = yield(aux, init)
        init += 1
    end
    return aux
end

exc9_a = my_inject(5, 10, true) do |sum, n|
    sum + n
end
exc9_b = my_inject(5, 10, true) do |sum, n|
    sum * n
end

puts exc9_a
puts exc9_b
