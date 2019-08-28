require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'

class RenterTest < Minitest::Test
  def setup
    @jessie = Renter.new("Jessie")
  end

  def test_it_exists
    assert_instance_of Renter, @jessie
  end
end
