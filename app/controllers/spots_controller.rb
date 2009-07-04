class SpotsController < ApplicationController
  before_filter :login_required, :only => [:create]
  
  def index
    @spots = Spot.all
  end
  
  def create
    @spot = Spot.create(params[:spot])

    respond_to do |format|
      format.html do
        redirect_to spot_path(@spot)
      end

      format.js do
        head :created
      end
    end
  end
end
