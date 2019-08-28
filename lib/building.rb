class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    average = @units.sum { |apartment| apartment.monthly_rent } / @units.size
  end

  def renter_with_highest_rent
      highest = @units.max_by {|apartment| apartment.monthly_rent}
      highest.renter
  end
end
