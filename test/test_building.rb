require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'


class BuildingTest < Minitest::Test

 def setup
   @building = Building.new
   @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
   @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
 end

 def test_building_exists
   assert_instance_of Building, @building
 end

 def test_building_starts_with_no_units
   assert_equal [], @building.units
 end

 def test_units_can_be_added
   @building.add_unit(@a1)
   @building.add_unit(@a2)
   assert_equal [@a1, @a2], @building.units
 end

 # def test_avarage_rent
 #   assert_equal 1099.5, @building.average_rent
 # end



end
