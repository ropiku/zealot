class SpotsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  def index
    @spots = Spot.all
  end
  
  def create
    @spot = Spot.new(params[:spot])

    respond_to do |format|
      format.html do
        if @spot.save
          redirect_to spot_path(@spot)
        else
          render :action => :new
        end
      end

      format.js do
        head :created
      end
    end
  end
  
  def new
    @spot = current_user.spots.new
  end
end
