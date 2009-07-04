class Rating < ActiveRecord::Base
  validates_uniqueness_of :spot_id, :context => :user_id

  belongs_to :user
  belongs_to :spot
end
