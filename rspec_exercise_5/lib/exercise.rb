def zip(*arrays)
    length = arrays.first.length    #arrays.map(&:length).max

    (0...length).map do |i|
        arrays.map do |ele|
            ele[i]
        end
    end
end

def prizz_proc(array, proc_1, proc_2)
    array.select do |ele|
        (proc_1.call(ele) && !proc_2.call(ele)) || (!proc_1.call(ele) && proc_2.call(ele))
    end
end

def zany_zip(*arrays)
    length = arrays.map(&:length).max

    (0...length).map do |i|
        arrays.map do |ele|
            ele[i]
        end
    end
end

def maximum(array, &prc)
    return nil if array.empty?

    max = array.first
    array.each do |ele|
        max = ele if prc.call(ele) >= prc.call(max)
    end
    max
end

def my_group_by(array, &prc)
    my_groups = Hash.new { |h, k| h[k] = [] }

    array.each do |ele|
        key = prc.call(ele)
        my_groups[key] << ele
    end

    my_groups
end

def max_tie_breaker(array, tie_breaker_proc, &prc)
    return nil if array.empty?
    
    max = array.first
    array.each do |ele|
        if prc.call(ele) > prc.call(max)
            max = ele
        elsif prc.call(ele) == prc.call(max) && tie_breaker_proc.call(ele) > tie_breaker_proc.call(max)
            max = ele
        end
    end
    max
end

def silly_syllables(string)
    words = string.split(' ')
    new_words = words.map do |word|
        num_vowels = vowel_pos(word).length
        if num_vowels < 2
            word
        else
            change_word(word)
        end
    end
    new_words.join(' ')
end

def vowel_pos(word)
    vowels = 'aeiou'
    indices = []

    word.each_char.with_index do |char, i|
        indices << i if vowels.include?(char)
    end
    indices
end

def change_word(word)
    indices = vowel_pos(word)
    word[indices.first..indices.last]
end