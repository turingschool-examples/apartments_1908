class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    rent = apartments.find_all do |apartment|
      apartment.monthly_rent
  end

  rent 
  # this was just my best guess about where to start and I couldn't finish in time.
end
