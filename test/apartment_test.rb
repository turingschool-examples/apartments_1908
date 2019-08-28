require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'

class ApartmentTest < Minitest::Test
  def setup
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @jessie = Renter.new("Jessie")
  end

  def test_it_exists
    assert_instance_of Apartment, @a1
  end

  def test_it_can_add_renter
    @a1.add_renter(@jessie)

    assert_equal @jessie, @a1.renter
  end
end
