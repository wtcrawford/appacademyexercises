def is_prime?(number)
    return false if number < 2

    (2...number).each do |divisor|
        if number % divisor == 0
            return false
        end
    end
    true
end

def nth_prime(n)        #nth_prime(2) => 3
    count = 0
    num = 1

    while count < n
        num += 1
        count += 1 if is_prime?(num)
    end
    num
end

def prime_range(min, max)
    primes = []

    (min..max).each do |num|
        primes << num if is_prime?(num)
    end

    primes
end