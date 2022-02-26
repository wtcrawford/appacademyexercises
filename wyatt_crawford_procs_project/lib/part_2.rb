def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(string, &prc)
    words = string.split(" ")
    new_words = []

    words.each do |word|
        new_words << prc.call(word)
    end

    new_words.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    result_1 = prc1.call(num)
    result_2 = prc2.call(num)

    if result_1 > result_2
        return result_1
    else
        return result_2
    end
end

def and_selector(array, prc_1, prc_2)
    new_array = []

    array.each do |ele|
        if prc_1.call(ele) && prc_2.call(ele)
            new_array << ele
        end
    end

    new_array
end

def alternating_mapper(array, prc_1, prc_2)
    new_array = []

    array.each_with_index do |ele, idx|
        if idx.even?
            new_array << prc_1.call(ele)
        else
            new_array << prc_2.call(ele)
        end
    end

    new_array
end