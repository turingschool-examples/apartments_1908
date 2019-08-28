class Apartment
  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms

  def initialize(apartment)
    @number = apartment[:number]
    @monthly_rent = apartment[:monthly_rent]
    @bathrooms = apartment[:bathrooms]
    @bedrooms = apartment[:bedrooms]
  end
end
