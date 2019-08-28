require 'pry'
require './lib/apartment'

class Renter
  attr_reader :name

  def initialize(name)
    @name = name
  end

end
