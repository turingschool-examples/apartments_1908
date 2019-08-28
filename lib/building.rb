class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(apartment)
    @units << apartment
  end

  def average_rent
    (@units[0].monthly_rent.to_f + @units[1].monthly_rent) / 2
  end

end
