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

  def renter_with_highest_rent
    # iterate through each element of units array
      # check if there is renter
    # if there is a renter, find the unit with the highest monthly rent using max_by
      # return the renter of that unit
    # if no renter, ignore

    max_rent = 0
    max_rent = @units.max_by do |unit|
      if unit.renter
        binding.pry
        unit.monthly_rent
      end
    end

    max_rent.renter
    binding.pry
  end
end
