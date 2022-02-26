def all_words_capitalized?(words)
    words.all? { |word| word.capitalize == word }
end

def no_valid_url?(url)
    valid = [".com", ".net", ".io", ".org"]

    url.none? do |domains|
        valid.any? { |ending| domains.end_with?(ending) }
    end

end

def any_passing_students?(students)
    students.any? do |student|
        avg = student[:grades].sum / (student[:grades].length * 1.0)
        avg >= 75
    end

end