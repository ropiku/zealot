require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_validate_presence_of :identity_url
  
  context "with existing users" do
    setup {@user = Factory.create :user}
    
    should_validate_uniqueness_of :identity_url
    should_validate_uniqueness_of :nickname
    should_validate_uniqueness_of :email
  end
end
