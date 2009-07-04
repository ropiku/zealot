class RatingsController < ApplicationController
  before_filter :login_required
  
  def create
    redirect_to home_path unless Spot.count(params[:rating][:spot_id]) == 1
    
    rating = current_user.ratings.find_by_spot_id(params[:rating][:spot_id])
    if rating
      rating.rating = params[:rating][:rating]
      rating.save
    else
      current_user.ratings.create(params[:rating])
    end
    
    respond_to do |format|
      format.html do
        redirect_to spot_path(params[:rating][:spot_id])
      end

      format.js do
        head :created
      end
    end

  end
end
