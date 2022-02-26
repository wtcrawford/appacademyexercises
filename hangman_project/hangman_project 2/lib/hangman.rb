class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")                  #["cat"] => ["_", "_", "_"]
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
    # if @attempted_chars.include?(char)
    #   return true
    # else
    #   return false
    # end
  end

  def get_matching_indices(char)
    matching_indices = []


    @secret_word.each_char.with_index do |char_secret, i|   #.each_char.with_index because secret_word is a string
      if char == char_secret
        matching_indices << i
      end
    end

    matching_indices
  end

  def fill_indices(char, ind)
    ind.each do |idx|
      @guess_word[idx] = char
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    end

    @attempted_chars << char

    matches = self.get_matching_indices(char)
    self.fill_indices(char, matches)                  
    @remaining_incorrect_guesses -= 1 if matches.empty?
    true
  end

  def  ask_user_for_guess
    puts "Enter a char: "
    char = gets.chomp
    self.try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    else
      return false
    end
  end
end
