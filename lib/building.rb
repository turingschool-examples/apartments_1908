require 'pry'

class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(apartment)
    @units << apartment
  end

  def average_rent
    sum = 0

    @units.each do |unit|
      sum += unit.monthly_rent
    end

    (sum.to_f / @units.length.to_f).round(2)
  end

  def renter_with_highest_rent
    units_occupied = @units.find_all {|unit| unit.renter != nil}

    highest_unit = units_occupied.max_by do |unit|
      unit.monthly_rent
    end

    highest_unit.renter
  end

  def annual_breakdown
    units_occupied = @units.find_all {|unit| unit.renter != nil}

    sorted_breakdown = Hash.new
    units_occupied.each do |unit|
      sorted_breakdown[unit.renter.name] = (unit.monthly_rent * 12)
    end

    sorted_breakdown.sort_by {|k, v| v}.to_h
  end

end
