require './logic'

module Play
  include Logic

  def play_breaker(rules, allowed_characters, secret_code=create_secret_code(rules, allowed_characters))
    puts "\nThe secret code is set!\nStart guessing!"
    @@guesses = 0
    
    loop do
      @@input = gets.chomp.upcase

      unless check_length?(@@input)
        puts "Please enter a guess of exactly four characters"
        next
      end

      unless check_chars?(allowed_characters, @@input)
        puts "Please enter a guess using only the following characters: " +
        allowed_characters
        next
      end

      @@feedback = check_guess(secret_code, @@input)
    
      unless @@feedback == [0]
        @@guesses += 1
        puts "BLACK: #{@@feedback[0]}, WHITE: #{@@feedback[1]}"
      else
        puts "You got it! Computer scored #{@@guesses} points!"
        break
      end
    end
  end

  def play_maker(rules, allowed_characters)
    @@guesses = 0

    loop do
      puts "\nPlease enter your secret code below."

      @@input = gets.chomp.upcase

      unless check_length?(@@input)
        puts "Please enter a code of exactly four characters"
        next
      end

      unless check_chars?(allowed_characters, @@input)
        puts "Please enter a code using only the following characters: " +
        allowed_characters
        next
      end

      break
    end
    loop do
      @@computer_guess = create_secret_code(rules, allowed_characters)

      @@feedback = check_guess(@@input, @@computer_guess)

      unless @@feedback == [0]
        @@guesses += 1
        next
      else
        puts "Computer got it! You scored #{@@guesses} points!"
        break
      end
    end
  end
end
