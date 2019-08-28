require 'pry'

class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units.push(unit)
  end

  def average_rent
    count = 0
    @units.each do |unit|
      count += unit.monthly_rent
    end
    count.to_f / @units.length
  end

  def renter_with_highest_rent
    rented = @units.find_all do |unit|
      unit.renter != nil
    end

    rented.max_by do |rented_unit|
      rented_unit.monthly_rent
    end.renter
  end
end
