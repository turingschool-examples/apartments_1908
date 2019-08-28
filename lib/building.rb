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
end
