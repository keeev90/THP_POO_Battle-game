require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

def perform 

  ### INTRO ###
  puts "----------------------------------------------------------------------"
  puts "🌟🌟🌟🌟🌟 Bienvenue dans le game 'Human vs POO-kemons' 🌟🌟🌟🌟🌟"
  puts "----------------------------------------------------------------------"
  puts " Le but du jeu est d'être le dernier survivant contre des pokemons! "
  puts "----------------------------------------------------------------------"
  puts

  ### INITIALISATION DU JOUEUR ###
  puts
  puts "Salut ! Quel est ton blase ?"
  print "> "
  human_name = gets.chomp 
  human_player = HumanPlayer.new(human_name)

  ### INITIALISATION DES POKEMONS ###
  pokemon1 = Player.new("Dracofeu")
  pokemon2 = Player.new("Magicarpe")
  pokemons = [pokemon1, pokemon2]
  
  puts
  puts "⚔️⚔️⚔️  Bienvenue #{human_player.name}. Tu as l'honneur de combattre contre #{pokemon1.name} et #{pokemon2.name} ! ⚔️⚔️⚔️"
  puts 
  puts "En garde, #{human_player.name} !"
  puts 

  # PARAMETRAGE DU MENU
  def menu(pokemon1, pokemon2) 
    puts
    puts "C'est à ton tour. Quelle action veux-tu effectuer ?"
    puts 
    puts "a - chercher une meilleure arme 🔫"
    puts "s - chercher à se soigner 💉"
    puts "1 - attaquer #{pokemon1.name} 👊"
    puts "2 - attaquer #{pokemon2.name} 👊"
    puts
    print "> "
    user_choice = gets.chomp.to_s
  end

  ### EXECUTION DU COMBAT ###
  while human_player.life_points > 0 && (pokemon1.life_points > 0 || pokemon2.life_points > 0) do
    puts
    puts "-----------------------------------"
    puts "Voici l'état de chaque combattant :"
    human_player.show_state
    pokemon1.show_state
    pokemon2.show_state
    puts

    ### TRANSITION ###
    puts "Appuie sur la touche ENTER pour exécuter le prochain round" 
    print "> "
    gets.chomp
    puts

    puts "LET'S FIGHT ! ⚔️ "

    ### HUMAN_PLAYER JOUE EN PREMIER A CHAQUE ROUND ###

    case menu(pokemon1, pokemon2)
      when "a"
        human_player.search_weapon
      when "s"
        human_player.search_health_pack
      when "1"
        human_player.attacks(pokemon1)
      when "2"
        human_player.attacks(pokemon2)
      else 
        puts "Mauvaise entrée...choisis une action parmi les options du menu."
        user_choice = gets.chomp.to_s #autre solution >>> "next" pour retour au début de la boucle !
    end

    ### TRANSITION ###
    puts 
    puts "Appuie sur la touche ENTER pour continuer le combat" 
    print "> "
    gets.chomp
    puts

    #### ATTAQUE DES POKEMONS ###
    puts "😱😱😱 C'est au tour des pokemons d'attaquer ! 😱😱😱"
    puts
    pokemons.each do |pokemon| 
      if pokemon.life_points > 0 #attaque d'un pokemon seulement s'il est encore en vie
        pokemon.attacks(human_player)
      else
        pokemon.show_state
      end
    end

    if human_player.life_points <= 0
      human_player.show_state
      puts 
      puts "💀💀💀 Aie aie aie ! T'es dead. GAME OVER 💀💀💀"
      break
    end

    if pokemon1.life_points <= 0 && pokemon2.life_points <= 0
      puts
      puts "✌️✌️✌️ Tous les pokemons sont dead. YOU WIN 🎉🎉🎉"
      break
    end

    puts 
    puts "Appuie sur la touche ENTER pour continuer le combat" 
    print "> "
    gets.chomp
    puts

  end
end
perform