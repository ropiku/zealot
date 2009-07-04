require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  should_have_db_column :rating
  should_have_db_column :spot_id
  should_have_db_column :user_id
end
