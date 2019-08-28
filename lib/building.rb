class Building
attr_reader :units

  def initialize
    @units = []
  end

  def add_units(apartment)
    @units << apartment
  end
end
