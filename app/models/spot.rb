class Spot < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :latitude
  validates_presence_of :longitude
  
  has_and_belongs_to_many :tags
  belongs_to :user
  has_many :ratings
  
  def rating
    self.ratings.average('rating').to_f
  end
end
