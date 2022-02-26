require "byebug"

def string_map!(string, &prc)
    (0...string.length).each do |i|
        string[i] = prc.call(string[i])
    end
    string
end

def three?(array, &prc)
    array.count { |ele| prc.call(ele)  } == 3
end

def nand_select(array, prc_1, prc_2)
    selected = []

    array.each do |ele|
        unless prc_1.call(ele) && prc_2.call(ele)
            selected << ele
        end
    end
    selected
end

def hash_of_array_sum(hash)
    sum = 0
    hash.each do |k, v|
        sum += v.sum
    end
    sum
end

def abbreviate(sentence)
    words = sentence.split(' ')
    new_sentence = []
    words.each do |word|
        if word.length > 4
            new_sentence << remove_vowels(word)
        else
            new_sentence << word
        end
    end
    new_sentence.join(' ')
end

def remove_vowels(word)
    vowels = "aeiouAEIOU"
    new_word = ""
    word.each_char do |char|
        if vowels.include?(char)
            new_word += ""
        else
            new_word += char
        end
    end
    new_word
end

def hash_selector(hash, *args)
    return hash if args.length == 0
    new_hash = {}
    args.each do |ele|
        if hash.has_key?(ele)
            new_hash[ele] = hash[ele]
        end
    end
    new_hash
end