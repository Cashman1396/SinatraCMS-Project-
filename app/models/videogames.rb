require "pry"
class VideoGame < ActiveRecord::Base
  belongs_to :user

  def self.find_by_slug(slug)
    title = slug.gsub("-", " ")
    VideoGame.find_by(title: title)
  end


  def sluggify
    slug = self.title.gsub(" ", "-")
  end
end
