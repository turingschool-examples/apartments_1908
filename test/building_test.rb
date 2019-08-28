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
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_it_starts_with_no_units
    assert_equal [], @building.units
  end

  def test_units_can_be_added
    add_units_a1_and_b2

    assert_equal [@a1, @b2], @building.units
  end

  def test_it_can_calculate_average_rent
    add_units_a1_and_b2

    assert_equal 1099.5, @building.average_rent
  end

  def test_average_rent_is_0_if_no_units
    assert_equal 0, @building.average_rent
  end

  def test_it_knows_renter_with_highest_rent
    assert_nil @building.renter_with_highest_rent

    add_spencer_to_b2
    add_units_a1_and_b2

    assert_equal @spencer, @building.renter_with_highest_rent

    add_jessie_to_a1

    assert_equal @jessie, @building.renter_with_highest_rent
  end

  def test_it_displays_hash_of_annual_rent_by_renter_name
    assert_equal Hash.new, @building.annual_breakdown

    add_spencer_to_b2
    add_units_a1_and_b2

    expected = { "Spencer" => 11988 }
    assert_equal expected, @building.annual_breakdown

    add_jessie_to_a1

    expected = { "Jessie" => 14400, "Spencer" => 11988 }
    assert_equal expected, @building.annual_breakdown
  end


  # Helper methods

  def add_units_a1_and_b2
    @building.add_unit(@a1)
    @building.add_unit(@b2)
  end

  def add_spencer_to_b2
    @spencer = Renter.new("Spencer")
    @b2.add_renter(@spencer)
  end

  def add_jessie_to_a1
    @jessie = Renter.new("Jessie")
    @a1.add_renter(@jessie)
  end

end
