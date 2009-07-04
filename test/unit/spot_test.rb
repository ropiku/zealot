require 'test_helper'

class SpotTest < ActiveSupport::TestCase
  should_have_db_column :name
  should_have_db_column :latitude
  should_have_db_column :longitude
end
