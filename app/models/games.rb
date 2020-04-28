require "pry"
class Game < ActiveRecord::Base 
  belongs_to :user 

  def self.find_by_slug(slug)
    title = slug.gsub("-", " ")
    Game.find_by(title: title)
  end 

  def sluggify 
    slug = self.title.gsub(" ", "-")
  end 
end 