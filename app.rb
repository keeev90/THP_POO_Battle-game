require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def perform 
  player1 = Player.new("Dracofeu")
  player2 = Player.new("Magicarpe")

  puts
  puts "๐๐๐ Welcome to the big fight of #{player1.name} against #{player2.name} ๐๐๐ \n\n"

  while player1.life_points > 0 && player2.life_points > 0 do
    puts
    puts "-----------------------------------"
    puts "Voici l'รฉtat de chaque combattant :"
    player1.show_state
    player2.show_state
    puts 

    puts "Appuie sur la touche ENTER pour exรฉcuter le prochain round" 
    print "> "
    gets.chomp
    puts

    puts "LET'S FIGHT ! โ๏ธ "
    player1.attacks(player2)
    if player2.life_points <= 0
      player2.show_state
      break
    else
      player2.attacks(player1)
      if player1.life_points <= 0
        player1.show_state
        break
      end
    end
  end
end 
perform

#binding.pry