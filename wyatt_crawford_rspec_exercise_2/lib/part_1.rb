def partition(arr, n)
    lesser = []
    greater = []

    arr.each do |ele|
        if ele < n
            lesser << ele
        else
            greater << ele
        end
    end
    [lesser, greater]
end

def merge(hash1, hash2)
    new_hash = {}
    hash1.each { |k, v| new_hash[k] = v }
    hash2.each { |k, v| new_hash[k] = v }
    new_hash
end

def censor(sentence, curse)
    bad_words = 
    curses = sentence.split

    new_words = curses.map do |word|
        if curse.include?(word.downcase)
            starred(word)
        else
            word
        end
    end
    new_words.join(" ")
end

def starred(word)
    vowels = "aeiou"
    new_w = ""

    word.each_char do |char|
        if vowels.include?(char.downcase)
            new_w += "*"
        else
            new_w += char
        end
    end

    new_w
end

def power_of_two?(n)
    product = 1
    while product < n
        product *= 2
    end

    product == n
end