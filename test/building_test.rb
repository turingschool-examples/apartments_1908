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
    @spencer = Renter.new("Spencer")
  end

  def test_it_exists
    assert assert_instance_of Building, @building
  end

  def test_default_empty_array_of_units
    assert_equal [], @building.units
  end

  def test_units_can_be_added
    @building.add_unit(@a1)
    @building.add_unit(@b2)

    assert_equal [@a1, @b2], @building.units
  end

  def test_average_rent
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal 1099.5, @building.average_rent
  end

  def test_renter_with_highest_rent
    @b2.add_renter(@spencer)
    @building.add_unit(@b2)
    assert_equal @spencer, @building.renter_with_highest_rent
  end
end
