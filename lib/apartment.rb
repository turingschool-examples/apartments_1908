class Apartment
  attr_reader :number,
              :monthly_rent,
              :bathrooms,
              :bedrooms,
              :renter

  def initialize(type)
    @number = type[:number]
    @monthly_rent = type[:monthly_rent]
    @bathrooms = type[:bathrooms]
    @bedrooms = type[:bedrooms]
    @renter = nil
  end

  def add_renter(person)
    @renter = person
  end
end
