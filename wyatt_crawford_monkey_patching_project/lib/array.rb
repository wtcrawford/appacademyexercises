# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    #if the length of our array is equal to 0. ie: empty array. return nil
    # if self.length == 0
    #     return nil
    # end
    return nil if self.empty?

    self.max - self.min
  end

  def average
    return nil if self.length == 0 

    self.sum / (self.length * 1.0)
  end

  def median
    return nil if self.length == 0
    #returns new array. ary = ["d", "a", "e", "c", "b"] ary.sort => ["a","b",etc.]    ary.sort { |a, b| b <=> a } => ["e", "d", "c", "b", "a"]. sorts the elements backwards
    #find middle index with avg?
    if self.length % 2 == 1 #odd?
        middle = self.length / 2.0
        return self.sort[middle]
    else
        #[1,2,3,4,5,6]
        sorted = self.sort                  #sorted variable
        middle =  self.length / 2.0         #finds the middle ele
        first = sorted[middle]              #gives us the second element in the center. ie: 4
        second = sorted[middle - 1]         #gives us the first element in the center. ie: 3
        avg = (first + second) / 2.0        # (3 + 4) / 2.0
    end
  end

  def counts
    count = Hash.new(0)
    self.each { |ele| count[ele] += 1 }
    count
  end

  def my_count(arg)
    num = 0

    self.each do |ele|
        if ele == arg
            num += 1
        end
    end
    num
  end

  def my_index(arg)
    self.each_with_index do |ele, i| #["a", "b", "c"]
        if ele == arg                #if "a" == "a"     "b" == "b"
            return i                 #return 0.         return 1.
        end
    end
    nil
  end

  def my_uniq                       #use a hash to find unique elements => keys
    hash = {}

    self.each { |ele| hash[ele] = true }
    hash.keys                       #get back an array of keys. 
  end

  def my_transpose
    new_array = []
    #push another array inside to have a 2D array
    (0...self.length).each do |row|             #always row followed by column
        new_row = []

        (0...self.length).each do |col|
            new_row << self[col][row]           #this order of [col][row] will flip it.
        end

        new_array << new_row
    end

    new_array
  end
end