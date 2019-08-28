require './lib/renter'
require './lib/apartment'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class RenterTest < Minitest::Test
  def setup
    @jessie = Renter.new("Jessie")
  end

  def test_existence
    assert_instance_of Renter, @jessie
  end

  def test_attributes
    assert_equal "Jessie", @jessie.name
  end
end
