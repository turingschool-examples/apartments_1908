require 'minitest/autorun'
require 'minitest/pride'

require './lib/renter'
require './lib/apartment'

class ApartmentTest < Minitest::Test
  def setup
    @unit = Apartment.new({
      number: "A1",
      monthly_rent: 1200,
      bathrooms: 1,
      bedrooms: 1
    })
    @jessie = Renter.new("Jessie")
  end

  def test_it_exists
    assert_instance_of Apartment, @unit
  end

  def test_initialization
    assert_equal "A1", @unit.number
    assert_equal 1200, @unit.monthly_rent
    assert_equal 1, @unit.bathrooms
    assert_equal 1, @unit.bedrooms
    assert_nil @unit.renter
  end

  def test_add_renter
    @unit.add_renter(@jessie)

    assert_equal @jessie, @unit.renter
  end
end
