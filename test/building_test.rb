require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'


class BuildingTest < MiniTest::Test

  def setup
    @building = Building.new
    @jessie = Renter.new("Jessie")
    @spencer = Renter.new("Spencer")
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_it_has_attributes
    assert_equal [], @building.units
  end

  def test_add_unit
    assert_equal [], @building.units
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal [@a1,@b2], @building.units
  end

  def test_average_rent
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal [@a1,@b2], @building.units
    assert_equal 1099.5, @building.average_rent
  end

  def test_renter_with_highest_rent
    @b2.add_renter(@spencer)
    @building.add_unit(@b2)
    assert_equal @spencer, @building.renter_with_highest_rent
    @a1.add_renter(@jessie)
    @building.add_unit(@a1)
    assert_equal @jessie, @building.renter_with_highest_rent
  end

  def test_annual_breakdown
    assert_equal ({}), @building.annual_breakdown
    @b2.add_renter(@spencer)
    @building.add_unit(@b2)
    assert_equal ({"Spencer" => 11988}), @building.annual_breakdown
    @a1.add_renter(@jessie)
    @building.add_unit(@a1)
    assert_equal ({"Jessie" => 14400, "Spencer" => 11988}), @building.annual_breakdown
  end

end
