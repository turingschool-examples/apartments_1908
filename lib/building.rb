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
    max_apt = occupied_units.max_by do |unit|
      unit.monthly_rent
    end

    if max_apt
      max_apt.renter
    else
      nil
    end
  end

  def annual_breakdown
    annual_rent = {}

    occupied_units.each do |unit|
      annual_rent[unit.renter.name] = unit.monthly_rent * 12
    end

    annual_rent
  end


  # Helper methods

  def occupied_units
    @units.find_all do |unit|
      unit.renter
    end
  end

end
