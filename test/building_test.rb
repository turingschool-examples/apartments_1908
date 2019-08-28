require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < Minitest::Test

  def setup
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @c3 = Apartment.new({number: "C3", monthly_rent: 600, bathrooms: 3, bedrooms: 1})
    @building = Building.new
    @spencer = Renter.new("Spencer")
    @jessie = Renter.new("Jessie")
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_units_starts_empty
    assert_equal [], @building.units
  end

  def test_can_add_units
    @building.add_unit(@a1)
    assert_equal [@a1], @building.units

    @building.add_unit(@b2)
    assert_equal [@a1, @b2], @building.units
  end

  def test_can_calculate_average_rent
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal 1099.5, @building.average_rent
  end

  def test_can_get_renter_with_highest_rent
    @c3.add_renter(@jessie)
    @b2.add_renter(@spencer)    
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    @building.add_unit(@c3)

    assert_equal @spencer, @building.renter_with_highest_rent
  end

  def test_can_make_annual_breakdown
    @b2.add_renter(@spencer)
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    @building.add_unit(@c3)
    breakdown = {"Spencer" => 11988}
    assert_equal breakdown, @building.annual_breakdown

    @a1.add_renter(@jessie)
    breakdown["Jessie"] = 14400
    assert_equal breakdown, @building.annual_breakdown
  end
end
