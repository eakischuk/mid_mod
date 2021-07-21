require './lib/passenger.rb'
require 'pry'

RSpec.describe Passenger do
  before(:each) do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  describe 'passenger' do
    it 'is a passenger' do
      expect(@charlie).to be_a(Passenger)
    end

    it 'has a name' do
      expect(@charlie.name).to eq("Charlie")
    end

    it 'has an age' do
      expect(@charlie.age).to eq(18)
    end

    it 'is an adult if 18' do
      expect(@charlie.adult?).to eq(true)
      expect(@taylor.adult?).to eq(false)
    end

    it 'can drive' do
      expect(@charlie.driver?).to eq(false)
      @charlie.drive
      expect(@charlie.driver?).to eq(true)
    end
  end
end
