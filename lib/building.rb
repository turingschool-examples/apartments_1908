class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(apartment_obj)
    @units << apartment_obj
  end

  def average_rent
    return 0 if @units.empty?

    @units.sum do |apartment|
      apartment.monthly_rent
    end / @units.length.to_f
  end

  def renter_with_highest_rent
    rented_units
      .max_by { |unit| unit.monthly_rent }
      .renter
  end

  def annual_breakdown
    report = Hash.new
    rented_units.each do |unit|
      renter_name = unit.renter.name
      report[renter_name] = unit.monthly_rent * 12
    end

    report
  end

  def rented_units
    @units.find_all { |unit| unit.renter }
  end
end
