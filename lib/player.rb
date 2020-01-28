class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage(damages_received)
    @life_points -= damages_received
    if @life_points <= 0
      puts "#{@name} a été tué !"
    end
  end

  def attacks(other_player)
    puts "#{@name} attaque #{other_player.name}"
    damages_inflicted = computes_damage
    puts "#{@name} inflige #{damages_inflicted} points de dommage."
    other_player.gets_damage(damages_inflicted)
  end

  def computes_damage
    rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}."
  end

  def computes_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon_found = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_found}."
    if weapon_found > @weapon_level
      puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level = weapon_found
    else
      puts "M@*#$... Elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack_found = rand(1..6)
    if health_pack_found == 1
      puts "Tu n'as rien trouvé..."
    elsif health_pack_found == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      if @life_points > 20
        @life_points = 100
      else
        @life_points += 80
      end
    else
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life_points > 50
        @life_points = 100
      else
        @life_points += 50
      end
    end
  end
end