require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'

class RenterTest < Minitest::Test

  def setup 
    @name = "Jessie"
    @jessie = Renter.new(@name)
  end

  def test_it_exists
    assert_instance_of Renter, @jessie
  end

  def test_it_has_a_name
    assert_equal @name, @jessie.name

end
pry(main)> jessie = Renter.new("Jessie")    
# => #<Renter:0x00007fa15c93af80...>

pry(main)> jessie.name
# => "Jessie"

pry(main)> a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})    
# => #<Apartment:0x00007fb3ecaae7c0...>

pry(main)> a1.number
# => "A1"

pry(main)> a1.monthly_rent
# => 1200

pry(main)> a1.bathrooms
# => 1

pry(main)> a1.bedrooms
# => 1

pry(main)> a1.renter
# => nil

pry(main)> a1.add_renter(jessie)

pry(main)> a1.renter
# => #<Renter:0x00007fb3ee106ce8...>