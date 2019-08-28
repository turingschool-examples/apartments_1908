require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'

class BuildingTest < Minitest::Test
  def setup
    building = Building.new
  end
end
