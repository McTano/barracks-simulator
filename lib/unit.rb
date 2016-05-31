class Unit

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    enemy.damage(attack_power)
  end

  def damage(x)
    @health_points -= x
  end

  attr_reader :health_points, :attack_power

end