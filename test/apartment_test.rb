require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'

class ApartmentTest < Minitest::Test

  def setup 
    @name = "Jessie"
    @jessie = Renter.new(@name)
    @apartment_data = {
      number: "A1",
      monthly_rent: 1200,
      bathrooms: 1,
      bedrooms: 1
    }
    @a1 = Apartment.new(@apartment_data)
  end

  def test_it_exists
    assert_instance_of Apartment, @a1
  end

  def test_it_has_attributes
    assert_equal @apartment_data[:number], @a1.number
    assert_equal @apartment_data[:monthly_rent], @a1.monthly_rent
    assert_equal @apartment_data[:bathrooms], @a1.bathrooms
    assert_equal @apartment_data[:bedrooms], @a1.bedrooms
  end

  def test_renter_starts_empty
    assert_nil @a1.renter
  end

  def test_can_add_renter
    @a1.add_renter(@jessie)
    assert_equal @jessie, @a1.renter
  end
end