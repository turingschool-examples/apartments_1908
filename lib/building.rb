class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units.push(unit)
  end

  def average_rent
    average_rent = @units.sum { |unit| unit.monthly_rent }
    average_rent /= @units.length.to_f
  end

  def renter_with_highest_rent
    max_unit = @units.max_by do |unit|
      unit.renter != nil ? unit.monthly_rent : 0
    end
    max_unit.renter
  end

  def annual_breakdown
    breakdown = {}
    @units.each do |unit|
      if unit.renter
        breakdown[unit.renter.name] = unit.monthly_rent * 12
      end
    end
    breakdown
  end
end
