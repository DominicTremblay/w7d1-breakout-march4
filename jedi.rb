class Jedi

  attr_reader :name, :ap
  attr_accessor :hp

  def initialize(name)
    @name = name
    @ap = 10
    @hp = 20
  end

  # prinout the status of the jedi
  def status
    puts "#{name} HP: #{hp} #{dead? ? 'Force Ghost!' : nil}"
  end

  def attacks(enemy_jedi)
    puts "#{name} attacks #{enemy_jedi.name}"
    damage = rand(ap) + 1
    enemy_jedi.takes_damage(damage)
  end

  def takes_damage(amount)
    puts "#{name} is taking #{amount} points of damage!"
    @hp -= amount
  end

  def dead?
    hp <= 0
  end


end