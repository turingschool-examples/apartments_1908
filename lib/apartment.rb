class Apartment
  def initialize(type)
    @number = type[:number]
    @monthly_rent = type[:monthly_rent]
    @bathrooms = type[:bathrooms]
    @bedrooms = type[:bedrooms]
  end
end
