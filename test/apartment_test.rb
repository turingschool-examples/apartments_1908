require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'

class ApartmentTest < Minitest::Test

  def setup
    @jessie = Renter.new("Jessie")
    @apartment = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
  end

  def test_it_exits
    assert_instance_of Apartment, @apartment
  end

  def test_it_has_attributes
    assert_equal "A1", @apartment.number
    assert_equal 1200, @apartment.monthly_rent
    assert_equal 1, @apartment.bathrooms
    assert_equal 1, @apartment.bedrooms
  end

  def test_it_starts_out_without_renter
    assert_nil @apartment.renter
  end

  def test_renter_can_be_added
    @apartment.add_renter(@jessie)

    assert_equal @jessie, @apartment.renter
  end
end
