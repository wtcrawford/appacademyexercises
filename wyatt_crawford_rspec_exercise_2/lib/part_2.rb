def palindrome?(string)
    string.each_char.with_index do |char, idx|
        if string[idx] != string[-idx - 1]
            return false
        end
    end
    true
end

def substrings(string)
    sub_arr = []

    (0...string.length).each do |start_i|
        (start_i...string.length).each do |end_i|     #don't start at 0 again
           sub_arr << string[start_i..end_i]
        end
    end
    sub_arr
end

def palindrome_substrings(string)
    substrings(string).select { |sub| palindrome?(sub) && sub.length > 1 }
end