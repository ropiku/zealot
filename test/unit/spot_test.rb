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

  context "tags" do
    setup do 
      @spot = Factory(:spot, :tags_string => '')
    end

    should "set tags from string_tags" do
      assert_equal(0, Tag.count)

      @spot.tags_string = "poop,happy"
      @spot.save

      assert_equal(2, Tag.count)
    end

    should "not die when setting the same tag all over again" do
      @spot.tags_string = "poop,happy"
      @spot.save

      @spot.tags_string = "poop,happy"
      @spot.save
    end
  end
end
