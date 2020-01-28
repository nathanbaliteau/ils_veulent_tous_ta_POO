require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#écran d'accueil du jeu
puts "-" * 49
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO !'      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-" * 49

#demande son prénom au joueur
puts " "
puts "Quel est ton petit nom ?"
human_player = HumanPlayer.new(gets.chomp)
puts " "

#crée des ennemis fictifs
enemies = []
player1 = Player.new('Josiane')
player2 = Player.new('José')
enemies.push(player1, player2)

#lance le combat jusqu'à la mort du joueur humain
#ou la mort de tous les ennemis fictifs
while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0) do
  
  #menu d'action pour le joueur humain et récupération de son choix
  puts "-" * 50
  puts " "
  human_player.show_state
  puts " "
  puts "Quelle action veux-tu effectuer ?"
  puts " "
  puts "a - Chercher une meilleure arme"
  puts "s - Chercher à se soigner"
  puts " "
  puts "Attaquer un joueur en vue :"
  print "0 - "
  player1.show_state
  print "1 - "
  player2.show_state
  puts " "
  puts "-" * 50
  puts " "
  answer = gets.chomp.to_s
  
  #lancement de l'action du joueur humain
  if answer == "a"
    human_player.search_weapon
  elsif answer == "s"
    human_player.search_health_pack
  elsif answer == "0"
    human_player.attacks(player1)
  elsif answer == "1"
    human_player.attacks(player2)
  end
  
  #riposte des ennemis fictifs
  gets.chomp
  puts "-" * 50
  puts " "
  puts "Les autres joueurs t'attaquent !"
  enemies.each do |player| 
    if player.life_points > 0
      player.attacks(human_player)
    end
  end
  gets.chomp  

end

#fin du jeu
puts " "
puts "-" * 50
puts " "
if human_player.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end


