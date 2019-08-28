require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'

class TestApartment < Minitest::Test

  def setup
    @apartment = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms:1})
  end

  def test_it_exists
  assert_instance_of Apartment, @apartment
  end

  def test_it_has_attributes
    assert_equal "A1", @apartment.number
    assert_equal 1200, @apartment.monthly_rent
    assert_equal 1, @apartment.bedrooms
    assert_equal 1, @apartment.bathrooms
  end
end
