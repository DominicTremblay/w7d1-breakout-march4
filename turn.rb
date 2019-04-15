class Turn

  attr_reader :current_player, :enemy_player

  def initialize(players)
    @players = players.shuffle
    @current_player = nil
    @enemy_player = nil
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
    @current_player = get_current_player 
    @enemy_player = get_enemy_player(@current_player)
    @players.rotate!
  end
end