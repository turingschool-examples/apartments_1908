require './lib/renter'
require './lib/apartment'

class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    count = 0
    total_rent = 0
    @units.each do|unit|
      total_rent += unit.monthly_rent
      count += 1
    end
    total_rent / count.to_f
  end

  def highest_rent
    highest_rent = 0
    highest_renter = nil
    @units.each do |unit|
      if unit.monthly_rent > highest_rent
        highest_rent = unit.monthly_rent
        highest_renter = unit.renter
      end
    end
    highest_renter
  end

  def annual_breakdown
    breakdown = {}
    @units.each do |unit|
      if unit.renter != nil
        breakdown[unit.renter.name] = unit.monthly_rent * 12
      end
    end
    breakdown
  end
end
