class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(apartment)
    @units << apartment
  end

  def average_rent
    rents = @units.map do |units|
      units.monthly_rent
    end
    rents.sum.fdiv(rents.length).round(1)
  end

  def renter_with_highest_rent
    occupied_units = @units.find_all do |unit|
      unit.renter != nil
    end

    highest_rent = occupied_units.max_by do |unit|
      unit.monthly_rent
    end

    highest_rent.renter
  end
end
