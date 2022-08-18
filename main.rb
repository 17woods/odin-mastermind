require './menu.rb'
require './play.rb'

class Main
  include Menu
  include Play

  def main
    main_menu

    if @@gamemode == 0
      play_breaker(@@rules, @@allowed_characters)

    elsif @@gamemode == 1
      play_maker(@@rules, @@allowed_characters)

    else
      puts "E0"
      exit

    end

    if play_again?
      main_menu
    else
      exit
    end
  end
end

qwe = Main.new
qwe.main
