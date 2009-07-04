require 'test_helper'

class SpotTest < ActiveSupport::TestCase
  should_have_db_column :name
  should_have_db_column :latitude
  should_have_db_column :longitude

  should_have_and_belong_to_many :tags
  should_belong_to :user
  should_have_many :ratings
  
  should_validate_presence_of :name
  should_validate_presence_of :latitude
  should_validate_presence_of :longitude
end
