require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'
require './lib/apartment'
require './lib/renter'

class BuildingTest < Minitest::Test

  def setup
    @building = Building.new
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_it_has_attributes
    assert_equal [], @building.units
  end

  def test_adding_units_to_it
    @building.add_unit(@a1)
    assert_equal [@a1], @building.units
    @building.add_unit(@b2)
    assert_equal [@a1, @b2], @building.units
  end

  def test_average_rent
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal 1099.5, @building.average_rent
  end

  def test_renter_with_highest_rent
    spencer = Renter.new("Spencer")
    jessie = Renter.new("Jessie")
    @b2.add_renter(spencer)
    @building.add_unit(@a1)
    @building.add_unit(@b2)

    assert_equal spencer, @building.renter_with_highest_rent
    @a1.add_renter(jessie)
    assert_equal jessie, @building.renter_with_highest_rent
  end

  def test_its_annual_breakdown
    spencer = Renter.new("Spencer")
    jessie = Renter.new("Jessie")
    @b2.add_renter(spencer)
    @building.add_unit(@a1)
    @building.add_unit(@b2)

    assert_equal 1, @building.annual_breakdown.count
    assert_equal 11988, @building.annual_breakdown["Spencer"]
    @a1.add_renter(jessie)
    assert_equal 2, @building.annual_breakdown.count
    assert_equal 14400, @building.annual_breakdown["Jessie"]
  end

end
