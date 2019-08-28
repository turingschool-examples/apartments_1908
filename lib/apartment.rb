class Apartment

  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms, :renter

  def initialize(apt_info)
    @apt_info = {}
    @number = apt_info[:number]
    @monthly_rent = apt_info[:monthly_rent]
    @bathrooms = apt_info[:bathrooms]
    @bedrooms = apt_info[:bedrooms]
    @renter = apt_info[:renter]
  end

  def add_renter(renter_info)
   @renter = renter_info

  end

end
