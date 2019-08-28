require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < Minitest::Test

  def setup
    @building = Building.new

    @a1 = Apartment.new({number: "A1",
                         monthly_rent: 1200,
                         bathrooms: 1,
                         bedrooms: 1})

    @b2 = Apartment.new({number: "B2",
                         monthly_rent: 999,
                         bathrooms: 2,
                         bedrooms: 2})
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_it_starts_with_no_units
    assert_equal [], @building.units
  end

  def test_units_can_be_added
    add_a1_and_b2

    assert_equal [@a1, @b2], @building.units
  end

  def test_it_can_calculate_average_rent
    add_a1_and_b2

    assert_equal 1099.5, @building.average_rent
  end

  def test_average_rent_is_0_if_no_units
    assert_equal 0, @building.average_rent
  end

  def test_it_knows_renter_with_highest_rent
    assert_nil @building.renter_with_highest_rent

    spencer = Renter.new("Spencer")
    @b2.add_renter(spencer)
    add_a1_and_b2

    assert_equal spencer, @building.renter_with_highest_rent

    jessie = Renter.new("Jessie")
    @a1.add_renter(jessie)

    assert_equal jessie, @building.renter_with_highest_rent
  end


  # Helper methods

  def add_a1_and_b2
    @building.add_unit(@a1)
    @building.add_unit(@b2)
  end

end
