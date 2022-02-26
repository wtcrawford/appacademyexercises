def strange_sums(numbers)
    count = 0

    numbers.each_with_index do |num1, idx1|
        numbers.each_with_index do |num2, idx2|
            if idx2 > idx1 && (num2 + num1) == 0
                count += 1
            end
        end
    end
    count
end

def pair_product(numbers, product)
    numbers.each_with_index do |num1, idx1|
        numbers.each_with_index do |num2, idx2|
            if idx2 > idx1 && (num2 * num1) == product
                return true
            end     
        end
    end
    false
end

def rampant_repeats(str, h)
    new_str = ''

    str.each_char do |char|
        if h.has_key?(char)
            new_str += char * h[char]
        else
            new_str += char
        end
    end
    new_str
end

def perfect_square(number)
    (1..number).any? { |num| num * num == number }
end

def
    num_factors(number)
    (1..number).count { |num| number % num == 0 }
end

def anti_prime?(number)
    amount = num_factors(number)
    (1...number).all? { |num| amount > num_factors(num)}
end

def matrix_addition(m1, m2)
    height = m1.length
    width = m1[0].length
    final = Array.new(height) { [0] * width }

    (0...height).each do |row|
        (0...width).each do |col|
            final[row][col] = m1[row][col] + m2[row][col]
        end
    end
    result
end

def factors(number)
    (1..number).select { |num| number % num == 0 }
end

def mutual_factors(*nums)
    nums
        .map { |n| factors(n) }
        .inject(:&)
end

def tribonacci_number(n)
    seq = [1, 1, 2]
    while seq.length <= n
        seq << seq[-3] + seq[-2] + seq[-1]
    end
    seq[n - 1]
end

def matrix_addition_reloaded(*matrices)
    matrix = matrices.first
    height = matrix.length
    width = matrix[0].length

    empty_matrix = Array.new(height) { [0] * width }
    matrices.inject(empty_matrix) do |m1, m2|
        return nil if m2.length != height or m2[0].length != width
        matrix_addition(m1, m2)
    end
end

def squarocol?(grid)
    return true if grid.any? { |row| row.uniq.length == 1 }
    return true if grid.transpose.any? { |col| col.uniq.length == 1 }   #use transpose to find columns
    false
end

def adjacent_sums(arr)
    sums = []
    (0...arr.length - 1).each do |i|
        sums << arr[i] + arr[i + 1]
    end
    sums
end

def pascals_triangle(n)
    triangle = [[1]]
    while triangle.length < n
        level_above = triangle.last
        next_level = [1]
        next_level += adjacent_sums(level_above)
        next_level << 1
        triangle << next_level
    end
    triangle
end

def prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % 1 == 0 }
end

def mersenne_prime(n)
    x = -1
    count = 0
    while count < n
        x += 1
        candidate = 2**x - 1
        count += 1 if prime?(candidate)
    end
    2**x - 1
end

def triangular_sequence(n)
    seq = []
    i = 1
    while i <= n
        seq << (i * (i + 1)) / 2
        i += 1
    end
    seq
end

def triangular_word?(word)
    alpha = ('a'..'z').to_a
    value = word
        .split('')
        .map { |char| alpha.index(char) + 1 }
        .sum
    triangular_nums = triangular_sequence(value)
    triangular_nums.include?(value)
end

def collapse(nums)
    (0...nums.length - 1).each do |i|
        if nums[i] + 1 == nums[i + 1] || nums[i] == nums[i + 1] + 1
            return nums[0...i] + nums[i + 2..-1]
        end
    end
    nums
end

def consecutive_collapse(numbers)
    numbers.each { numbers = collapse(numbers) }
    numbers
end

def next_prime(number, i)
    step = 1
    if i < 0
        i = -(i)
        step = -(step)
    end

    prime_count = 0
    while prime_count < i
        return nil if number < 0
        number += step
        prime_count += 1 if prime?(number)
    end
    number
end

def pretentious_primes(numbers, n)
    numbers.map { |num| next_prime(num, n) }
end