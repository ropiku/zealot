class SpotsController < ApplicationController
  before_filter :login_required, :except => [:index, :show, :search]
  
  def index
    @spots = Spot.all
  end
  
  def show
    @spot = Spot.find params[:id]
  end
  
  def create
    @spot = current_user.spots.new(params[:spot])

    respond_to do |format|
      format.html do
        if @spot.save
          redirect_to spot_path(@spot)
        else
          render :action => :new
        end
      end

      format.js do
        @spot.save
        head :created
      end
    end
  end
  
  def new
    @spot = current_user.spots.new
  end
  
  def search
    #TODO replace with sphinx for more speed
    @spots = Spot.all :conditions => ["name LIKE ?", "%#{params[:q]}%"]

    respond_to do |format|
      format.html {}
      format.js do
        render :json => @spots.to_json
      end
    end
  end
end
