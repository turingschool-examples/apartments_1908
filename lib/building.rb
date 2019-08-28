class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(apartment)
    @units << apartment
  end

  def average_rent
    rents = @units.map do |units|
      units.monthly_rent
    end
    rents.sum.fdiv(rents.length).round(1) 
  end

end
