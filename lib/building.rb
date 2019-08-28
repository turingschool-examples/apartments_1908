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
end
