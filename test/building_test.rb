require './lib/renter'
require './lib/apartment'
require './lib/building'
require 'minitest/autorun'
require 'minitest/pride'

class TestBuilding < Minitest::Test
  def setup
    @jessie = Renter.new("Jessie")
    @spencer = Renter.new("Spencer")
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @c3 = Apartment.new({number: "C3", monthly_rent: 1500, bathrooms: 2, bedrooms: 2})
    @building = Building.new
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_it_starts_with_no_units
    assert_equal [], @building.units
  end

  def test_it_can_add_units
    @building.add_unit(@a1)

    assert_equal [@a1], @building.units

    @building.add_unit(@b2)

    assert_equal [@a1,@b2], @building.units
  end

  def test_it_can_calculate_average_rent
    @building.add_unit(@a1)
    @building.add_unit(@b2)

    assert_equal 1099.5, @building.average_rent
  end

  def test_it_can_identify_highest_paying_renter
    @a1.add_renter(@jessie)
    @b2.add_renter(@spencer)
    @building.add_unit(@a1)
    @building.add_unit(@b2)

    assert_equal @jessie, @building.highest_rent
  end

  def test_it_can_generate_an_annual_breakdown
    @a1.add_renter(@jessie)
    @b2.add_renter(@spencer)
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    @building.add_unit(@c3)

    assert_equal ({"Jessie"=>14400, "Spencer"=>11988}), @building.annual_breakdown
  end
end
