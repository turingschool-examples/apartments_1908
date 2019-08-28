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

  def renter_with_highest_rent
    occupied_units = @units.find_all do |unit|
      unit.renter
    end

    max_apt = occupied_units.max_by do |unit|
      unit.monthly_rent
    end

    if max_apt
      max_apt.renter
    else
      nil
    end
  end

end
