class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(apartment)
    @units.push(apartment)
  end

  def average_rent
    if @units.length > 0
      total_rent = @units.sum do |unit|
        unit.monthly_rent
      end

      (total_rent.to_f / @units.length).round(1)
    else
      0
    end
  end

end
