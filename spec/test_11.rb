require_relative 'spec_helper'

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end

  it "has and knows its HP (health points)" do
    expect(@barracks.health_points).to eq(500)
  end

  it "should take 5 damage when attacked by a Footman" do
    @footman = Footman.new
    @footman.attack!(@barracks)
    expect(@barracks.health_points).to eq(495)
  end

end

describe Footman do

  before :each do
    @footman = Footman.new
  end

  it "does half damage against buildings" do
    @barracks = Barracks.new
    hp_before_attack = @barracks.health_points
    @footman.attack!(@barracks)

    hp_after_attack = @barracks.health_points
    damage = hp_before_attack - hp_after_attack

    expect(damage).to eq((@footman.attack_power / 2).ceil)
  end

end