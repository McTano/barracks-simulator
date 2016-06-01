class Unit

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    return false if self.dead? || enemy.dead?
    enemy.damage(attack_power)
    true
  end

  def damage(damage_points)
    @health_points -= damage_points
  end

  def dead?
    health_points <= 0
  end

  attr_reader :health_points, :attack_power

end