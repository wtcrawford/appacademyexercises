def no_dupes?(array)
    count = Hash.new(0)

    array.each { |ele| count[ele] += 1 }
    count.keys.select { |ele| count[ele] == 1 }
end

#p no_dupes?([1, 1, 2, 3, 4])

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |idx|
        return false if arr[idx] == arr[idx + 1]

    end
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog']) #=> true
# p no_consecutive_repeats?(['cat', 'cat', 'dog']) #=> false

def char_indices(string)
    indices = Hash.new { |h, k| h[k] = [] }
    string.each_char.with_index { |char, i| indices[char] << i }
    indices
end

# p char_indices('mississippi')
# p char_indices('classroom')

def longest_streak(str)
    current = ""
    longest = ""

    (0...str.length).each do |i|
        if str[i] == str[i - 1]
            current += str[i]
        else
            current = str[i]
        end

        if current.length >= longest.length
            longest = current
        end
    end
    longest
end

# p longest_streak('a')
# p longest_streak('accccbbb')
# p longest_streak('aaaxyyyyyzz')
# p longest_streak('abc')

def bi_prime?(num)
    prime_Facts = prime_factors(num)
    prime_facts.any? do |a|
        b = num / a
        prime_facts.include?(b)
    end
end

def prime?(num)
    return false if num < 2

    (2...num).none? { |i| num % i == 0 }
end

def prime_factors(num)
    (2..num).select { |factor| num % factor == 0  && prime?(factor) }
end

# p bi_prime?(14)   true
# p bi_prime?(22)   true
# p bi_prime?(25)   true
# p bi_prime?(24)   false

def vigenere_cipher(message, keys)
    new_msg = ""
    alphabet = ("a".."z").to_a

    message.each_char.with_index do |char, idx|
        old_pos = alpha.index(char)
        new_pos = old_pos + keys[idx % keys.length]
        new_msg += alpha[new_pos % alpha.length]
    end

    new_msg
end

def vowel_rotate(str)
    new_str = str[0..-1]
    vowels = "aeiou"
    vowel_indices = (0...str.length).select { |i| vowels.include?(str[i]) }
    new_vowel_indices = vowel.indices.rotate(-1)

    vowel_indices.each_with_index do |vowel_idx, i|
        new_vowel = str[new_vowel_indices[i]]
        new_str[vowel_idx] = new_vowel
    end
    new_str
end

class String
    def select(&prc)
        new_str = ""
        self.each_char do |char|
            new_str += char if prc.call(char)
        end
        new_str
    end

    def map!(&prc)
        self.each_char do |char|
            self[i] = prc.call(char, i)
        end
    end
end

def multiply(a, b)
    return 0 if b == 0

    if b < 0
        -(a + multiply(a, (-b) - 1))
    else
        a + multiply(a, b - 1)
    end

end

def lucas_sequence(length)
    return [] if length == 0
    return [2] if length == 1
    return [2, 1] if length == 2

    seq = lucas_sequence(length - 1)
    next_ele = seq[-1] + seq[-2]
    seq << next_ele
    seq
end

def prime_factorization(num)
    (2...num).each do |fact|
        if num % fact == 0
            other_fact = num / fac
            return [*prime_factorization(fact), *prime_factorization(other_fact) }
        end
    end
    [num]
end
