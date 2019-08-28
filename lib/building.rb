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
    true
  end
end
