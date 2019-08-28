require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'
require 'pry'

class TestApartment < Minitest::Test

  def setup
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @jessie = Renter.new("Jessie")
  end

  def test_it_exists
  assert_instance_of Apartment, @a1
  end

  def test_it_has_attributes
    assert_equal "A1", @a1.number
    assert_equal 1200, @a1.monthly_rent
    assert_equal 1, @a1.bedrooms
    assert_equal 1, @a1.bathrooms
  end

  def test_renter_name
    assert_equal "Jessie", @jessie.name
  end

  def test_new_renter
    assert_equal "Jessie", @a1.renter
  end
end
