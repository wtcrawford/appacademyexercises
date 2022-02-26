def select_even_nums(num)
    num.select(&:even?)
end

def reject_puppies(doggos)
    doggos.reject { |doggos| doggos["age"] <= 2  }
end

def count_positive_subarrays(array)
    array.count { |sub| sub.sum > 0 }
end

def aba_translate(string)
    new_word = ""
    vowels = "aeiou"

    string.each_char do |char|
        if vowels.include?(char)
            new_word += char + "b" + char
        else
            new_word += char
        end
    end

    new_word
end

def aba_array(words)
    words.map { |arr| aba_translate(arr) }
end

#testttttttttttt