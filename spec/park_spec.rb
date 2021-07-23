require './lib/passenger'
require './lib/vehicle'
require './lib/park'

RSpec.describe do Park
  before(:each) do
    @park = Park.new("Rocky", 10)
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    @vehicle.add_passengers(@charlie)
    @vehicle.add_passengers(@taylor)
  end

  describe 'park' do
    it 'is a Park object' do
      expect(@park).to be_a(Park)
    end

    it 'has a name' do
      expect(@park.name).to eq("Rocky")
    end

    it 'has a fee' do
      expect(@park.admission).to eq(10)
    end

    it 'starts without vehicles' do
      expect(@park.vehicles).to eq([])
    end

    it 'vehicles can enter park' do
      @park.add_vehicle(@vehicle)

      expect(@park.vehicles).to eq([@vehicle])
    end

    it 'knows there are passengers' do
      @park.add_vehicle(@vehicle)

      expect(@park.passengers).to eq([@charlie, @taylor])
    end

    it 'knows passengers are adults' do
      @park.add_vehicle(@vehicle)

      expect(@park.total_adults).to eq(1)
      @vehicle.add_passengers(@jude)
      expect(@park.total_adults).to eq(2)
    end

    it 'generates revenue' do
      @vehicle.add_passengers(@jude)
      @park.add_vehicle(@vehicle)

      expect(@park.revenue_generated).to eq(20)
    end
  end
end
