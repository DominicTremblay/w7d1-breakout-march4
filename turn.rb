class Turn

  attr_reader :current_player, :enemy_player

  def initialize(players)
    @players = players.shuffle
    @round = 0
  end

  def get_current_player
    @players.select{|player| !player.dead?}.first
  end

  def get_enemy_player(current)
    @players.select {|player| player != current && !player.dead?}.sample
  end

  def next_round
    @round += 1
    puts "ROUND ##{@round} begins"
    @players.rotate!
  end
end