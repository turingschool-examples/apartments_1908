require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'

class BuildingTest < Minitest::Test
  def setup
    @building = Building.new
  end

  def test_it_has_attributes
    assert_equal [], @building.units
  end
end
