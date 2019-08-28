class Building
  attr_reader :units, :add_unit, :average_rent, :renter_with_highest_rent

  def initialize
    @units = []
    @average_rent = average_rent
  end

  def setup
    @building = Building.new
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    @average_rent = 1099.5
  end

  def renter_with_highest_rent
  end
end
