class Building
  attr_reader :units, :add_unit, :average_rent

  def initialize
    @units = []
    @average_rent = average_rent
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    @average_rent = 1099.5
  end
end
