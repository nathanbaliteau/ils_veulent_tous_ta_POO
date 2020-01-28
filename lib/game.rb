class Game
  attr_accessor :enemies, :human_player

  def initialize(human_player_name)
    @human_player = HumanPlayer.new(human_player_name)
    puts "Comment s'appelleront tes 4 ennemis ?"
    @enemies = Array.new(4) {|i| i = Player.new(gets.chomp.to_s)}
  end

  def kill_player(player_to_kill)
    @enemies.delete(player_to_kill)
    
  end
end