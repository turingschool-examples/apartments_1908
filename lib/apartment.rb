require './lib/renter'

class Apartment
  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms, :renter
  def initialize(params = {})
    @number = params[:number]
    @monthly_rent = params[:monthly_rent]
    @bathrooms = params[:bathrooms]
    @bedrooms = params[:bedrooms]
    @renter = renter
  end

  def add_renter(name)
    @renter = @jessie
  end

end
