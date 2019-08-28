class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    all_rents = []
    @units.each do |apartment|
      all_rents << apartment.monthly_rent
    end
    all_rents.sum.to_f / all_rents.count
  end

end
