class Rating < ActiveRecord::Base
  validates_uniqueness_of :spot_id, :context => :user_id
  
  validates_inclusion_of :rating, :in => 1..5
  
  belongs_to :user
  belongs_to :spot
end
