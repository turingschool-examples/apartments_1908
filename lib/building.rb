class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    count = 0
    total_rent = 0
    @units.each do|unit|
      total_rent += unit.monthly_rent
      count += 1
    end
    total_rent / count.to_f
  end
end
