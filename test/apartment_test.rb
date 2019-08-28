require './lib/renter'
require './lib/apartment'
require 'minitest/autorun'
require 'minitest/pride'

class ApartmentTest < Minitest::Test

  def setup
    @renter = Renter.new("Renter")
    @apartment = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
  end

  def test_it_exists
    assert_instance_of Apartment, @apartment
  end

  def test_it_has_attributes
    assert_equal "A1", @apartment.number
    assert_equal 1200, @apartment.monthly_rent
    assert_equal 1, @apartment.bathrooms
    assert_equal 1, @apartment.bedrooms
    assert_nil @apartment.renter
  end

  def test_for_add_renter
    @apartment.add_renter(@renter)
    assert_equal @renter, @apartment.renter
  end
end
