class Building

  def initialize
    @building = []
  end

  def units
    @a1 = Apartment.new({number:"A1", monthly_rent: 1200, bathrooms:1, bedrooms:1}),
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms:2, bedrooms:2})
  end
end
