class Apartment

  attr_reader :number,
              :monthly_rent,
              :bathrooms,
              :bedrooms

  def initialize(apartment_hash)
    @number = apartment_hash[:number]
    @monthly_rent = apartment_hash[:monthly_rent]
    @bathrooms = apartment_hash[:bathrooms]
    @bedrooms = apartment_hash[:bedrooms]
  end

end
