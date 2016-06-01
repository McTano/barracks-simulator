class Barracks

  def initialize
    @health_points = 500
    @gold = 1000
    @food = 80
    @lumber = 500
  end

  attr_reader :gold, :food, :health_points, :lumber

  def dead?
    health_points <= 0
  end

  def can_train_footman?
    food >= 2 && gold >= 135
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    end
  end

  def can_train_peasant?
    food >= 5 && gold >= 90
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

  def can_train_siege_engine?
    food >= 3 && gold >= 200 && lumber >= 60
  end

  def train_siege_engine
    if can_train_siege_engine?
    @food -= 3
    @gold -= 200
    @lumber -= 60
    SiegeEngine.new
    end
  end

  def damage(damage_points)
    @health_points -= damage_points
  end

end
