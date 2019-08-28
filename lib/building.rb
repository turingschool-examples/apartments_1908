class Building
  attr_reader :units
  def initialize
    @units = []
  end

  def add_unit(unit)
    @units.push unit
  end

  def average_rent
    total = 0
    @units.each do |unit|
      total += unit.monthly_rent
    end
    total.to_f / @units.length
  end

  def renter_with_highest_rent
    units_in_use = @units.find_all do |unit|
      unit.renter != nil
    end

    highest_rent = units_in_use.max_by do |unit|
      unit.monthly_rent
      # binding.pry
    end
    highest_rent.renter
  end
end
