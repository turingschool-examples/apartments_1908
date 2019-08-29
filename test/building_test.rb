require 'minitest/autorun'
require 'minitest/pride'

require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < Minitest::Test
  def setup
    @building = Building.new
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @jessie = Renter.new("Jessie")
    @spencer = Renter.new("Spencer")
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_initialization
    assert_empty @building.units
  end

  def test_add_units
    @building.add_unit(@a1)
    assert_equal [@a1], @building.units

    @building.add_unit(@b2)
    assert_equal [@a1, @b2], @building.units
  end

  def test_avg_rent
    assert_equal 0, @building.average_rent

    @building.add_unit(@a1)
    assert_equal 1200, @building.average_rent

    @building.add_unit(@b2)
    assert_equal 1099.5, @building.average_rent
  end

  def test_renter_with_highest_rent
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    @b2.add_renter(@spencer)
    assert_equal @spencer, @building.renter_with_highest_rent
    @a1.add_renter(@jessie)
    assert_equal @jessie, @building.renter_with_highest_rent
  end

  def test_annual_breakdown
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    @b2.add_renter(@spencer)
    assert_equal ({"Spencer" => 11988}), @building.annual_breakdown
    @a1.add_renter(@jessie)
    assert_equal ({"Spencer" => 11988, "Jessie" => 14400}), @building.annual_breakdown
  end

  def test_rented_units
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    @b2.add_renter(@spencer)
    assert_equal [@b2], @building.rented_units
    @a1.add_renter(@jessie)
    assert_equal [@a1, @b2], @building.rented_units
  end
end
