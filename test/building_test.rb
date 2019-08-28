require './lib/renter'
require './lib/apartment'
require './lib/building'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class BuildingTest < Minitest::Test

  def setup
    @david = Renter.new("David")
    @zac = Renter.new("Zac")
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @building = Building.new
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_for_empty_units
    assert_equal [], @building.units
  end

  def test_for_adding_units
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal [@a1, @b2], @building.units
  end

  def test_for_average_rent
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal 1099.5, @building.average_rent
  end

  def test_for_highest_renter
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    @b2.add_renter(@david)
    assert_equal @david, @building.renter_with_highest_rent
    @a1.add_renter(@zac)
    assert_equal @zac, @building.renter_with_highest_rent
  end
end
