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

  def renter_with_highest_rent
    highest_rent = []
    @units.find do |unit|
      if unit.renter != nil
        highest_rent << unit
      end
    end
    renter = highest_rent.max_by do |unit|
      unit.monthly_rent
    end
    renter.renter
  end
end
