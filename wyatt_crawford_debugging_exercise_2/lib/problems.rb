# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    num.downto(2) do |factor|
        if num % factor == 0 && prime?(factor)
            return factor
        end
    end
end

def prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0 }  #returns true when none of the elements in your range satisfy
end                                       #the expression

def unique_chars?(string) 
    seen = []
    string.each_char do |char|
       if seen.include?(char)
        return false
       end
       seen << char 
    end

    true
end

def dupe_indices(array)
    indices = Hash.new { |hash, key| hash[key] = [] }  #make value of key an empty array
    array.each_with_index do |ele, i|
        indices[ele] << i
    end
    indices.select { |ele, array| array.length > 1 }
end

def ana_array(arr1, arr2)
    count1 = ele_count(arr1)
    count2 = ele_count(arr2)

    count1 == count2
end

def ele_count(arr)
    count = Hash.new(0)

    arr.each { |ele| count[ele] += 1 }     #"cat" is our ele. count it up 

    count               #make sure to call your count
end

ele_count(["cat", "cat", "dog"]) # => {"cat" =>2, "dog"=>1}