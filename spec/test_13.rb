require_relative 'spec_helper'

describe SiegeEngine do
  before :each do
    @siege_engine = SiegeEngine.new
  end

  it "starts with 400 HP (health points)" do
    expect(@siege_engine.health_points).to eq(400)
  end

  it "has 50 AP (attack power)" do
    expect(@siege_engine.attack_power).to eq(50)
  end

  describe '#attack!(@enemy)' do

    it 'can attack a barracks' do
      @barracks = Barracks.new
      expect(@siege_engine.attack!(@barracks)).to be_truthy
    end

    it 'does double damage against a barracks' do
      @barracks = Barracks.new
      @siege_engine.attack!(@barracks)
      expect(@barracks.health_points).to eq(400)
    end

    it 'cannot attack a unit that is not a siege engine' do
      @unit = Unit.new(60, 10)
      expect(@siege_engine.attack!(@unit)).to be_nil
    end

    it 'can attack other siege engines' do
      @other_siege_engine = SiegeEngine.new
      expect(@siege_engine.attack!(@other_siege_engine)).to be_truthy
    end
  end

end

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end

  it 'starts with 500 lumber' do
      expect(@barracks.lumber).to eq(500)
    end

  describe '#can_train_siege_engine?' do

    it 'returns true when gold >= 200, lumber >= 60, food >= 3' do
      expect(@barracks.can_train_siege_engine?).to be_truthy
    end

    it 'returns false when gold < 200' do
      expect(@barracks).to receive(:gold).and_return(100)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

    it 'returns false when lumber < 60' do
      expect(@barracks).to receive(:lumber).and_return(30)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

    it 'returns false when food < 3' do
      expect(@barracks).to receive(:food).and_return(1)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

  end

  describe '#train_siege_engine' do

    it 'costs 200 gold, 3 food, and 60 lumber.' do
      @barracks.train_siege_engine
      expect(@barracks.gold).to eq(800)
      expect(@barracks.food).to eq(77)
      expect(@barracks.lumber).to eq(440)
    end

    it "does not train a footman if there aren't enough resources" do
      expect(@barracks).to receive(:can_train_siege_engine?).and_return(false)
      expect(@barracks.train_siege_engine).to be_nil
    end

    it "trains a footman if there are enough resources" do
      expect(@barracks).to receive(:can_train_siege_engine?).and_return(true)
      expect(@barracks.train_siege_engine).to be_a(SiegeEngine)
    end

  end

end
