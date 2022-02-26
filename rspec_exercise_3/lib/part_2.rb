def element_count(array)
    count = Hash.new(0)
    array.each do |key|
        count[key] += 1
    end
    count
end

def char_replace!(string, hash)
    (0...string.length).each do |i|         #0 - 4
        if hash.has_key?(string[i])         #iterate through each character in the string and if that character in our string matches a key in our hash
            string[i] = hash[string[i]]     #take our string character match and set it equal to our hash[key value of[character in our string]]
        end
    end
    string
end

def product_inject(array)
    array.inject do |ele, ele_1|
        ele * ele_1
    end
end