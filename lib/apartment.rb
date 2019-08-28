class Apartment
  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms, :renter

  def initialize(a1)
    @number = a1[:number]
    @monthly_rent = a1[:monthly_rent]
    @bathrooms = a1[:bathrooms]
    @bedrooms = a1[:bedrooms]
    @renter = nil
  end

  def add_renter(name)
    @renter
  end

end
