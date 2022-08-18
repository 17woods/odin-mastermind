module Logic
  def create_secret_code(rules, allowed_characters)
    secret_code = String.new

    until secret_code.length == 4
      char = allowed_characters[rand(allowed_characters.length)]

      unless rules[:duplicates]
        if secret_code.include?(char)
          next
        end
      end

      secret_code += char
    end
    secret_code
  end

  def check_chars?(allowed_characters, guess)
    guess.split('').all? { |char| allowed_characters.include?(char) }
  end

  def check_length?(guess)
    guess.length == 4
  end

  def check_guess(answer, guess)
    right = 0
    almost = 0
    wrong = 0

    p answer, guess

    if answer == guess
      return [0]
    end

    for char in guess.split('')
      if guess[guess.index(char)] == answer[guess.index(char)]
        right += 1
      elsif answer.include?(char)
        almost += 1
      else
        wrong += 1
      end
    end

    [right, almost, wrong]
  end
end
