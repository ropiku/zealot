class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end
end
