require 'pry'
require './lib/renter'
require './lib/apartment'

class Building
  attr_reader :units#, :active_units

  def initialize
    @units = []
    @active_units = []

  end

  def add_unit(unit)
    @units << unit
  end

  def active_units
  @active_units = @units.find_all do |unit|
      unit.renter != nil
    end
  end

  def average_rent
    total_rent = 0
    @units.each do |unit|
      total_rent += unit.monthly_rent
    end
    average_rent = (total_rent.to_f / @units.count.to_f).to_f
  end

  def renter_with_highest_rent
    active_units
    highest_rent_unit = @active_units.first

     @active_units.each do |unit|
      if unit.monthly_rent > highest_rent_unit.monthly_rent
        highest_rent_unit = unit
      end
    end

    highest_rent_unit.renter
  end


end
