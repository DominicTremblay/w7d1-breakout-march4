require_relative './jedi'
require_relative './turn'

class Game

  def initialize
    @jedi1 = Jedi.new("Obiwan")
    @jedi2 = Jedi.new("Yoda")
    @jedi3 = Jedi.new("Mace Windu")
    @jedi4 = Jedi.new("Darth Maul")
    @jedis = [@jedi1, @jedi2, @jedi3, @jedi4]
    @turn = Turn.new(@jedis)
  end

  def summary
    puts
    puts "-------- SUMMARY ---------"
    puts @jedis.map{|jedi| jedi.status}
  end

  def game_over?
    @jedis.select {|jedi| !jedi.dead?}.count == 1
  end

  def end_game
    winner = @jedis.select{|jedi| !jedi.dead?}.first
    puts "#{winner.name} has killed them all!"
  end

  def run
    
    until (game_over?)
      @turn.next_round
      current_jedi = @turn.get_current_player
      enemy_jedi = @turn.get_enemy_player(current_jedi)

      current_jedi.attacks(enemy_jedi)
      summary
      sleep 0.7
    end

    end_game

  end

end