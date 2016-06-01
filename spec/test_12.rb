require_relative 'spec_helper'

describe Unit do

  before :each do
    @unit = Unit.new(60, 10)
  end

  describe '#dead?' do

    it "exists" do
      expect{@unit.dead?}.not_to raise_error
    end

    it "returns false if the unit's HP > 0" do
      expect(@unit).to receive(:health_points).and_return(1)
      expect(@unit.dead?).to be false
    end

    it "returns true if the unit's HP == 0" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to be true
    end

    it "returns true if the unit's HP < 0" do
      expect(@unit).to receive(:health_points).and_return(-1)
      expect(@unit.dead?).to be true
    end

  end

  describe '#attack!' do
    before :each do
      @enemy = Unit.new(50, 0)
      @unit.attack!(@enemy)
    end

    it "returns nil if it is dead." do
      expect(@unit).to receive(:dead?).and_return(true)
      expect(@unit.attack!(@enemy)).to be_nil
    end

    it "returns nil if its enemy is dead." do
      expect(@enemy).to receive(:dead?).and_return(true)
      expect(@unit.attack!(@enemy)).to be_nil
    end

    it "attacks if both are alive." do
      expect(@unit).to receive(:dead?).and_return(false)
      expect(@enemy).to receive(:dead?).and_return(false)
      expect(@unit.attack!(@enemy)).to be_truthy
    end


  end

end