require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class TestBuilding < Minitest::Test

  def setup
    @building = Building.new
    @a1 = Apartment.new({number:"A1", monthly_rent: 1200, bathrooms:1, bedrooms:1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms:2, bedrooms:2})
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_it_has_units
    assert_equal @b2, @building.units
  end
end
