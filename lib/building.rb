
class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    sum = 0
    @units.each do |unit|
      sum += unit.monthly_rent
    end
    (sum.to_f / @units.length)
  end

  def renter_with_highest_rent
    @units.keep_if do |unit|
      unit.renter != nil
    end
  highest_rent = @units.max_by do |unit|
      unit.monthly_rent
    end
    highest_rent.renter
  end

  def annual_breakdown
    annual_breakdown = {}
    @units.keep_if do |unit|
      unit.renter != nil
    end
    @units.each do |unit|
      annual_breakdown[unit.renter.name] = (unit.monthly_rent*12)
    end
    annual_breakdown
  end

end
