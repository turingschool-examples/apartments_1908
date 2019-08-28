class Building
attr_reader :units

  def initialize
    @units = []
  end

  def add_units(apartment)
    @units << apartment
  end

  def average_rent
    rent = []
    @units.find_all do |unit|
      rent << unit.monthly_rent
    end

    sum = 0
    rent.each do |num|
      sum += num
    end
    x = sum.to_f / 2
    x
  end

  def renter_with_highest_rent
    @units.max_by do |unit|
      occupied = unit.renter != nil
      binding.pry
      if !occupied
        unit.key(unit.monthly_rent)
      end
    end
  end

end
