class AddUserAndDescriptionToSpot < ActiveRecord::Migration
  def self.up
    add_column :spots, :user_id, :integer
    add_column :spots, :description, :text
  end

  def self.down
    remove_column :spots, :description
    remove_column :spots, :user_id
  end
end
