class SiegeEngine < Unit

  def initialize
    super(400, 50)
  end

  def attack!(enemy)
    unless self.dead? || enemy.dead?
      enemy.damage(attack_power * (enemy.is_a?(Barracks) ? 2 : 1))
    end
  end


end