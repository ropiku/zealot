class Spot < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user
  has_many :ratings
  
  def rating
    self.ratings.average('rating').to_f
  end
end
