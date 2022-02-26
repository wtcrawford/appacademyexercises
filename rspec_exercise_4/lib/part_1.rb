def my_reject(array, &prc)
    new_array = []

    array.each do |ele|
        new_array << ele if !prc.call(ele)
    end
    new_array
end

def my_one?(array, &prc)
    array.count(&prc) == 1
end

def hash_select(hash, &prc)
    new_hash = {}

    hash.each do |k, v|
        new_hash[k] = v if prc.call(k, v)
    end
    new_hash
end

def xor_select(array, prc_1, prc_2)
    array.select do |ele|
        (prc_1.call(ele) || prc_2.call(ele)) && (!prc_1.call(ele) || !prc_2.call(ele))
    end
end

def proc_count(value, procs)
    procs.count do |prc|
        prc.call(value)
    end
end