require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require 'pry'


class ApartmentTest < Minitest::Test
  def setup
    @a1 = Apartment.new({number: "A1",
                        monthly_rent: 1200,
                        bathrooms: 1,
                        bedrooms:1})
  end

  def test_existence_of_apartment
    assert_instance_of Apartment, @a1
  end

  def test_attributes
    assert_equal "A1", @a1.number
    assert_equal 1200, @a1.monthly_rent
    assert_equal 1, @a1.bathrooms
    assert_equal 1, @a1.bedrooms
    assert_equal nil, @a1.renter
  end

  def test_add_renter
    assert_equal @jessie, @a1.renter
  end
  end
