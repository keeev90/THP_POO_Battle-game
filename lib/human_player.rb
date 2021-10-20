class HumanPlayer < Player
  attr_accessor :weapon_level # /!\ penser à appeler les attributs qui différent de ceux de la classe mère

  def initialize(name) #paramétrage de l'objet spécifique Human
    super(name)
    @life_points = 30 
    @weapon_level = 1
  end

  def show_state
    if @life_points <= 0
      puts "Sorry #{@name}, you'r dead ! ☠️"
    else 
      puts "* Hey #{@name}, tu as #{@life_points} points de vie ❤️  et une arme de niveau #{@weapon_level.to_i} "
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..3)
    puts "Bravo #{@name}, tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! L'arme trouvée est meilleure que ton arme actuelle, elle est a toi pour le reste du jeu. 👌🔫"
    else
      puts "Zut, l'arme trouvée n'est pas mieux que ton arme actuelle."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack <= 3 #comparaison d'une variable avec le résultat souhaité
      puts "Zut #{@name}, tu n'as rien trouvé !"
    elsif health_pack >= 4 && health_pack <= 5 
      puts "Cool #{@name}, tu as trouvé un pack de +10 points de vie ❤️!"
      @life_points += 10
    elsif health_pack == 6
      puts "Waow #{@name}, tu as trouvé un pack de +20 points de vie ❤️❤️!"
      @life_points += 20
    end
    @life_points = 30 if @life_points > 30
    #@life_points = @life_points.clamp(0, 100) >>> autre méthode pour borner un résultat : https://www.bigbinary.com/blog/ruby-2-4-adds-comparable-clamp-method
  end 
end
