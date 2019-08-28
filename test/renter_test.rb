require './lib/renter'
require 'minitest/autorun'
require 'minitest/pride'

class RenterTest < Minitest::Test

  def setup
    @renter = Renter.new("Renter")
  end

  def test_it_exists
    assert_instance_of Renter, @renter
  end

  def test_it_has_attributes
    assert_equal "Renter", @renter.name
  end
end
