class FixSpots < ActiveRecord::Migration
  def self.up
    change_column :spots, :latitude, :decimal, :precision => 15, :scale => 10
    change_column :spots, :longitude, :decimal, :precision => 15, :scale => 10
  end

  def self.down
    change_column :spots, :latitude, :decimal
    change_column :spots, :longitude, :decimal
  end
end
