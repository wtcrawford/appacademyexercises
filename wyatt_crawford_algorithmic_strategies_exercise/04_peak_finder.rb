# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr)
    peaks = []

    arr.each.with_index do |ele, idx|
        left = arr[idx - 1]   #write conditional for the start
        #mid = ele. Can just use ele to represent middle number
        right = arr[idx + 1]  #write conditional for the end

        if idx == 0 && ele > right      #left-most number
            peaks << ele
        elsif idx == arr.length - 1 && ele > left    #right-most number
            peaks << ele
        elsif ele > left && ele > right       #middle instance
            peaks << ele
        end

    end

    return peaks
end



#try with .map

p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]
