module Menu
  attr_reader :rules

  @@rules = {
    duplicates: false,
    blanks: false
  }

  def main_menu
    loop do
      puts "\nMastermind\n1. Play as Code Breaker\n2. Play as Code Maker\n" +
      "3. Options\n4. Quit"

      @@input = gets.chomp

      @@allowed_characters = String.new

      case @@rules[:blanks]
        when true
          @@allowed_characters = "ABCDEF-"
        when false
          @@allowed_characters = "ABCDEF"
        else
          puts "E1"
          exit
      end

      case @@input
        when '1'
          @@gamemode = 0
          break
        when '2'
          @@gamemode = 1
          break
        when '3'
          options_menu
        when '4'
          exit
        else
          puts 'Invalid input'
        end
    end
  end

  def options_menu
    loop do
      puts "\nOptions\n1. Back\n2. Duplicates: #{@@rules[:duplicates]}\n" +
      "3. Blanks: #{@@rules[:blanks]}"

      @@input = gets.chomp

      case @@input
        when '1'
          break
        when '2'
          toggle_duplicates
        when '3'
          toggle_blanks
        else
          puts 'Invalid input'
      end
    end
  end

  def toggle_duplicates
    @@rules[:duplicates] = !@@rules[:duplicates]
  end

  def toggle_blanks
    @@rules[:blanks] = !@@rules[:blanks]
  end
end
