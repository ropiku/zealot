class Spot < ActiveRecord::Base
  attr_accessible :name, :latitude, :longitude, :tags_string
  
  validates_presence_of :name
  validates_presence_of :latitude
  validates_presence_of :longitude
  
  has_and_belongs_to_many :tags
  belongs_to :user
  has_many :ratings
  
  def rating
    self.ratings.average('rating').to_f
  end
  
  def tags_string=(string)
    return if string.nil?
    self.tags.delete_all

    string.split(',').each do |tag|
      self.tags << Tag.find_or_create_by_name(tag.strip)
    end
  end
  
  def tags_string
    self.tags.all.map {|t| t.name}.join(', ')
  end
end
