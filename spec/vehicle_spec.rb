require './lib/passenger.rb'
require './lib/vehicle'
require 'pry'

RSpec.describe Vehicle do
  before(:each) do
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  describe 'vehicle' do
    it 'is a vehicle' do
      expect(@vehicle).to be_a(Vehicle)
    end

    it 'has a year' do
      expect(@vehicle.year).to eq("2001")
    end

    it 'has a make' do
      expect(@vehicle.make).to eq("Honda")
    end

    it 'has a model' do
      expect(@vehicle.model).to eq("Civic")
    end

    it 'does not start out speeding' do
      expect(@vehicle.speeding?).to eq(false)
    end

    it 'can speed' do
      @vehicle.speed
      expect(@vehicle.speeding?).to eq(true)
    end

    it 'starts without passengers' do
      expect(@vehicle.passengers).to eq([])
    end

    it 'can add passengers' do
      @vehicle.add_passengers(@charlie)
      @vehicle.add_passengers(@jude)
      @vehicle.add_passengers(@taylor)

      expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
    end
  end
end
