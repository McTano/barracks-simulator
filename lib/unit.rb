class Unit

  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    enemy.damage(attack_power) unless self.dead? || enemy.dead?
  end

  def damage(damage_points)
    @health_points -= damage_points
  end

  def dead?
    health_points <= 0
  end

  

end