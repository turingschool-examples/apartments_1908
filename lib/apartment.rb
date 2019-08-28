class Apartment
  attr_reader :number,
              :monthly_rent,
              :bathrooms,
              :bedrooms,
              :renter

  def initialize(attrs)
    @number = attrs[:number]
    @monthly_rent = attrs[:monthly_rent]
    @bathrooms = attrs[:bathrooms]
    @bedrooms = attrs[:bedrooms]
    @renter = nil
  end

  def add_renter(renter)
    @renter = renter
  end

end
