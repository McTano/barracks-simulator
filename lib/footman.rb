# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit

  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    super(60, 10)
  end

  def attack!(enemy)
    unless self.dead? || enemy.dead?
      enemy.damage(attack_power / (enemy.is_a?(Barracks) ? 2 : 1))
    end
  end


end
