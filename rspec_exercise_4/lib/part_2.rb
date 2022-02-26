def proper_factors(number)
    (1...number).select do |ele|
        number % ele == 0
    end
end

def aliquot_sum(number)
    proper_factors(number).sum
end

def perfect_number?(number)
    aliquot_sum(number) == number
end

def ideal_numbers(n)
    nums = []

    count = 1
    while nums.length < n
        nums << count if perfect_number?(count) 
        count += 1
    end
    nums
end