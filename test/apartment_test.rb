require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'

class ApartmentTest < Minitest::Test

  def setup
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
    assert_equal nil, @apartment.renter #initial attribute
  end

  def test_method_add_renter
    @jessie = Renter.new("Jessie")
    @apartment.add_renter(@jessie)
    assert_equal @jessie, @apartment.renter
    assert_instance_of Renter, @apartment.renter
  end

end
