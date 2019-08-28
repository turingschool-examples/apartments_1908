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
  
end
