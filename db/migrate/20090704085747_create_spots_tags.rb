class CreateSpotsTags < ActiveRecord::Migration
  def self.up
    create_table :spots_tags do |t|
      t.integer :spot_id, :unsigned => true
      t.integer :tag_id, :unsigned => true

      t.timestamps
    end
  end

  def self.down
    drop_table :spots_tags
  end
end
