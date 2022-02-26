class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars_arr)
    chars_arr.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def initialize(chars_arr)
    if Code.valid_pegs?(chars_arr)
      @pegs = chars_arr.map(&:upcase)
    else
      raise "invalid pegs"
    end
  end
######
  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(random_pegs)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def [](idx)
    @pegs.[](idx)
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    
    (0...guess.length).each do |idx|
      count += 1 if guess[idx] == @pegs[idx]
    end
    count
  end

  def num_near_matches(guess)
    ###same code as walkthrough but still getting an rspec error for "should not include exact matches"
    count = 0

    (0...guess.length).each do |idx|
      if guess[idx] != @pegs[idx] && self.pegs.include?(guess[idx])
        count += 1
      end
    end

    count
  end

  def ==(other_code)
    self.pegs == other_code.pegs
  end
end
