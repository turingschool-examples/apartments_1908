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

  def occupied_units
    @units.find_all do |unit|
      unit.renter != nil
    end
  end

  def renter_with_highest_rent
    highest_rent = occupied_units.max_by do |unit|
      unit.monthly_rent
    end
    highest_rent.renter
  end

  def annual_breakdown
    name_total_hash = Hash.new
    occupied_units.each do |unit|
      name_total_hash[unit.renter.name] = unit.monthly_rent * 12
    end
    name_total_hash
  end
end
