require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'

class ApartmentTest < Minitest::Test
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
    assert_equal 1, @a1.bathrooms
    assert_equal 1, @a1.bedrooms
  end

  def test_renter_default_nil
    assert_nil @a1.renter
  end

  def test_renter_can_be_added
    @a1.add_renter(@jessie)

    assert_equal @jessie, @a1.renter
  end


end
