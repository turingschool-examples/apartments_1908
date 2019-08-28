require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require 'pry'

class Building
  attr_reader :units
  def initialize
    @units = []
  end

  def add_unit(apartment)
    @units << apartment
  end

  def average_rent
    average = @units.sum do |apartment|
      apartment.monthly_rent
    end
    monthly_rent / @units.length
  end
end

  def renter_with_highest_rent
    highest = @units.max do |apartment|
      apartment.monthly_rent
  end
    highest
end
