require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require 'pry'

class RenterTest < Minitest::Test

  def setup
    @jessie = Renter.new("Jessie")
  end

  def test_it_exists
    assert_instance_of Renter, @jessie
  end

  def test_attributes_at_init
    assert_equal "Jessie", @jessie.name
  end

end
