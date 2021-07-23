class Park
  attr_reader :name, :admission, :vehicles

  def initialize(name, admission)
    @name = name
    @admission = admission
    @vehicles = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def passengers
    @vehicles.flat_map do |vehicle|
      vehicle.passengers
    end
  end

  def total_adults
    @vehicles.sum do |vehicle|
      vehicle.num_adults
    end
  end

  def revenue_generated
    @admission * total_adults
  end
end
