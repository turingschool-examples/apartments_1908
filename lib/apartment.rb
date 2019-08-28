class Apartment
  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms, :renter
  def initialize(information)
    @number = information[:number]
    @monthly_rent = information[:monthly_rent]
    @bathrooms = information[:bathrooms]
    @bedrooms = information[:bedrooms]
    @renter = nil
  end

  def add_renter(renter)
    @renter = renter
  end
end
