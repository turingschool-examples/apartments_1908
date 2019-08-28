class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(apartment)
    @units << apartment
  end

  def average_rent
    @units.sum do |unit|
      unit.monthly_rent
    end / @units.count.to_f
  end
end
