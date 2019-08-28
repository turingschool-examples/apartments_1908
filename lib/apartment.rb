class Apartment
  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms

  def initialize(a1)
    @number = a1[:number]
    @monthly_rent = a1[:monthly_rent]
    @bathrooms = a1[:bathrooms]
    @bedrooms = a1[:bedrooms]
  end

  def renter
    a1 = {number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1}
    a1[:renter] = "Jessie"
  end
end
