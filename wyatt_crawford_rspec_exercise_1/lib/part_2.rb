def hipsterfy(word)
    vowels = "aeiou"        #designate vowels

    i = word.length - 1     #go to last letter in the word
    while i >= 0
        if  vowels.include?(word[i])
             return word[0...i] + word[i + 1..-1]
        end 
        i -= 1                  #go backwards through the string
    end
    word
end

def vowel_counts(str)
    count = Hash.new(0)
    vowels = "aeiou"

    str.each_char do |char|
        if vowels.include?(char.downcase)
            count[char.downcase] += 1
        end
    end
    count
end

def caesar_cipher(msg, n)
    alphabet = ("a".."z").to_a
    new_msg = ""

    msg.each_char do |char|
        if alphabet.include?(char)
            old_index = alphabet.index(char)
            new_index = old_index + n
            new_msg += alphabet[new_index % 26]
        else
            new_msg += char
        end
    end

    new_msg
end