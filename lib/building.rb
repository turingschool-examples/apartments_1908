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

  def renter_with_highest_rent
    highest_renter = nil
    highest_rent = 0

    @units.each do |apartment|
      if apartment.renter != nil
        if apartment.monthly_rent >= highest_rent
          highest_rent = apartment.monthly_rent
          highest_renter = apartment.renter
        end
      end
    end
    highest_renter
  end

  def annual_breakdown
    annual_rents = {}

    @units.each do |apartment|
      if apartment.renter != nil
        annual_rents[apartment.renter.name] = apartment.monthly_rent * 12
      end
    end
    annual_rents
  end

end
