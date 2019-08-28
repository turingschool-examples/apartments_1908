require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < Minitest::Test

  def setup
    @building = Building.new

    @a1 = Apartment.new({number: "A1",
                         monthly_rent: 1200,
                         bathrooms: 1,
                         bedrooms: 1})
    @b2 = Apartment.new({number: "B2",
                         monthly_rent: 999,
                         bathrooms: 2,
                         bedrooms: 2})

    @spencer = Renter.new("Spencer")
    @jessie = Renter.new("Jessie")

    @b2.add_renter(@spencer)
    @a1.add_renter(@jessie)

    @building.add_unit(@a1)
    @building.add_unit(@b2)
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_it_starts_with_an_empty_array_of_units
    assert_equal [], @building.units
  end

  def test_it_can_add_units
    assert_equal [@a1], @building.add_unit(@a1)
    assert_equal [@a1, @a2], @building.add_unit(@a2)
    assert_equal [@a1, @a2], @building.units
  end

  def test_it_can_return_average_rent
    assert_equal 1099.5, @building.average_rent
  end

  def test_it_can_access_renter_by_highest_rent
    assert_equal @jessie, @building.renter_with_highest_rent
  end

end
