require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'
require './lib/apartment'

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
end
