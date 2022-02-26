def some?(array, &prc)
    array.each do |ele|
        return true if prc.call(ele)
    end
    false
end

def exactly?(array, n, &prc)
    count = 0
    array.each do |ele|
        count += 1 if prc.call(ele)
    end
    count == n
end

def filter_out(array, &prc)
    filtered = []
    array.each do |ele|
        filtered << ele if prc.call(ele) == false
    end
    filtered
end

def at_least?(array, n, &prc)
    count = 0
    array.each do |ele|
        count += 1 if prc.call(ele)
    end
    count >= n
end

def every?(array, &prc)
    array.each do |ele|
        return false if !prc.call(ele)
    end
    true
end

def at_most?(array, n, &prc)
    count = 0
    array.each do |ele|
        count += 1 if prc.call(ele)
    end
    count <= n
end

def first_index(array, &prc)
    array.each_with_index do |ele, i|
        return i if prc.call(ele)
    end
    nil
end

def xnor_select(array, prc1, prc2)
    selected = []
    array.each do |ele|
        selected << ele if prc1.call(ele) == prc2.call(ele)
    end
    selected
end

def filter_out!(array, &prc)
    array.uniq.each { |ele| array.delete(ele) if prc.call(ele) }
end

def multi_map(array, n = 1, &prc)
    mapped = []
    array.each do |ele|
        n.times { ele = prc.call(ele) }
        mapped << ele
    end
    mapped
end

def proctition(array, &prc)
    trues = []
    falses = []
    array.each do |ele|
        if prc.call(ele)
            trues << ele
        else
            falses << ele
        end
    end
    [ *trues, *falses ]
end

def selected_map!(array, prc1, prc2)
    array.each_with_index do |ele, i|
        array[i] = prc2.call(ele) if prc1.call(ele) #take the value of the second call if the first call is true then replace the original array[i] with it
    end
    nil
end

def chain_map(val, prcs)
    prcs.inject(val) { |accum, prc| prc.call(accum) }
end

def proc_suffix(sentence, hash)
    words = sentense.split(' ')
    new_words = []
    words.each do |word|
        new_word = word
        hash.each do |prc, suffix|
            new_word += suffix if prc.call(word)
        end
        new_words << new_word
    end
    new_words.join(' ')
end
#########study proctition more
def proctition_platinum(array, *prcs)
    partition = {}
    prcs.each_index { |i| partition[i + 1] = [] }
    array.each do |ele|
        prcs.each_with_index do |prc, i|
            if prc.call(ele)
                partition[i + 1] << ele
                break
            end
        end
    end
    partition
end

# is_yelled = Proc.new { |s| s[-1] == '!' }
# is_upcase = Proc.new { |s| s.upcase == s }
# contains_a = Proc.new { |s| s.downcase.include?('a') }
# begins_w = Proc.new { |s| s.downcase[0] == 'w' }

# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a)
# # {1=>["when!", "WHERE!"], 2=>["what"]}
# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, is_upcase, contains_a)
# # {1=>["when!", "WHERE!"], 2=>["WHO", "WHY"], 3=>["what"]}
# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_upcase, is_yelled, contains_a)
# # {1=>["WHO", "WHERE!", "WHY"], 2=>["when!"], 3=>["what"]}
# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], begins_w, is_upcase, is_yelled, contains_a)
# # {1=>["WHO", "what", "when!", "WHERE!", "WHY"], 2=>[], 3=>[], 4=>[]}


def procipher(sentence, cipher)
    words = sentence.split(' ')
    new_words = words.map do |word|
        new_word = word
        cipher.each do |checker, changer|
            new_word = changer.call(new_word) if checker.call(word)
        end
        new_word
    end
    new_words.join(' ')
end

# is_yelled = Proc.new { |s| s[-1] == '!' }
# is_upcase = Proc.new { |s| s.upcase == s }
# contains_a = Proc.new { |s| s.downcase.include?('a') }
# make_question = Proc.new { |s| s + '???' }
# reverse = Proc.new { |s| s.reverse }
# add_smile = Proc.new { |s| s + ':)' }

# p procipher('STOP that taxi now!',
#     is_upcase => add_smile,
#     is_yelled => reverse,
#     contains_a => make_question
# ) # "STOP:) that??? taxi??? !won"

def picky_procipher(sentence, cipher)
    words = sentence.split(' ')
    new_words = words.map do |word|
        key_procs = cipher.keys
        matches = key_procs.select { |prc| prc.call(word) }
        if matches.length >= 1
            key_proc = matches.first
            value_proc = cipher[key_proc]
            value_proc.call(word)
        else
            word
        end
    end
    new_words.join(' ')
end

# is_yelled = Proc.new { |s| s[-1] == '!' }
# is_upcase = Proc.new { |s| s.upcase == s }
# contains_a = Proc.new { |s| s.downcase.include?('a') }
# make_question = Proc.new { |s| s + '???' }
# reverse = Proc.new { |s| s.reverse }
# add_smile = Proc.new { |s| s + ':)' }

# p picky_procipher('he said what!',
#     is_yelled => make_question,
#     contains_a => reverse
# ) # "he dias what!???"

# p picky_procipher('he said what!',
#     contains_a => reverse,
#     is_yelled => make_question
# ) # "he dias !tahw"

# p picky_procipher('he said what!',
#     contains_a => reverse,
#     is_yelled => add_smile
# ) # "he dias !tahw"

# p picky_procipher('stop that taxi now',
#     is_upcase => add_smile,
#     is_yelled => reverse,
#     contains_a => make_question
# ) # "stop that??? taxi??? now"

# p picky_procipher('STOP that taxi!',
#     is_upcase => add_smile,
#     is_yelled => reverse,
#     contains_a => make_question
# ) # "STOP:) that??? !ixat"
