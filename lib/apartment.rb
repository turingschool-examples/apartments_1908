class Apartment
  attr_reader :number, :monthly_rent, :bedrooms, :bathrooms, :renter

  def initialize(details_hash)
    @number = details_hash[:number]
    @monthly_rent = details_hash[:monthly_rent]
    @bedrooms = details_hash[:bedrooms]
    @bathrooms = details_hash[:bathrooms]
    @renter = nil
  end
  # def initialize(number:"b4", monthly_rent: 100, bedrooms:, bathrooms:)
  #   @number = number
  #   @monthly_rent = monthly_rent
  #   @bedrooms = bedrooms
  #   @bathrooms = bathrooms
  # end

  def add_renter(renter)
    @renter = renter
  end
end
