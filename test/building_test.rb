require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'
require './lib/apartment'
require 'pry'

class BuildingTest < Minitest::Test
  def setup
    @building = Building.new
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
  end

  def test_it_has_attributes
    assert_equal [], @building.units
  end

  def test_it_can_add_units
    @building.add_unit(@a1)
    assert_equal [@a1], @building.units
    @building.add_unit(@b1)
    assert_equal [@a1, @b1], @building.units
  end

  def test_it_can_find_average_rent
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    expected = 1099.5
    assert_equal expected, @building.average_rent
  end
end
