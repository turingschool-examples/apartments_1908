class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    rents = []
    @units.find_all do |unit|
      rents << unit.monthly_rent
    end
    average = (rents.sum.to_f / rents.count.to_f)
  end
end
