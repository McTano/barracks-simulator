require_relative 'spec_helper'


describe SiegeEngine do
  before :each do
    @siege_engine = SiegeEngine.new
  end

  it "has and knows its HP (health points)" do
    expect(@siege_engine.health_points).to eq(400)
  end

  it "has and knows its AP (attack power)" do
    expect(@siege_engine.attack_power).to eq(50)
  end

  describe '#attack!(@enemy)' do

    it 'can attack a barracks' do
    end

    it 'does double damage against a barracks'
    end

    it 'cannot attack a unit that is not a siege engine' do
    end

    it 'can attack other siege engines'
  end


  end

end

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end

  describe '#can_train_siege_engine?' do

    it 'has and knows its lumber count' do
    end

    it 'returns false when gold is less than 200' do
    end

    it 'returns false when lumber is less than 60' do
    end

    it 'returns false when food is less than 3' do
    end

    it 'returns true when gold >= 200, lumber >= 60, food >= 3' do

    end

    it 'costs 200 gold, 60 lumber, 3 food' do
    end

  end

  describe '#train_siege_engine' do
  end

end