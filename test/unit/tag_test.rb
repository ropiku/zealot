require 'test_helper'

class TagTest < ActiveSupport::TestCase
  should_have_db_column :name
  
  should_have_and_belong_to_many :spots
end
