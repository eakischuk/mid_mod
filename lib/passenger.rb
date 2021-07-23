class Passenger
  attr_reader :name, :age

  def initialize(info)
    @name = info["name"]
    @age = info["age"]
    @driver = false
  end

  def driver?
    @driver
  end

  def drive
    @driver = true
  end

  def adult?
    @age > 17
  end
end
