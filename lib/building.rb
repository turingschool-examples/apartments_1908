class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    @units.sum do |unit|
      unit.monthly_rent.to_f / @units.length
    end
  end

  def renter_with_highest_rent
    @units.max_by do |unit|
      unit.monthly_rent.renter
    end

  end


end
