require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'
require 'pry'

class BuildingTest < Minitest::Test

  def setup
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @building = Building.new
  end

  def test_it_exits
    assert_instance_of Building, @building
  end

  def test_it_starts_without_units
    assert_equal [], @building.units
  end

  def test_building_can_add_units
    @building.add_units(@a1)
    @building.add_units(@b2)

    assert_equal [@a1, @b2], @building.units
  end


end
