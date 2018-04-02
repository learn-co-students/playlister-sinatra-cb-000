class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  # i dont understand what im doing.
  # works, but i wouldnt be able to explain why it does

  def slug
    # not sure why self.name is better than @name here
    self.name.downcase.gsub(/\s/, '-')
  end

  def self.find_by_slug(slug)
    # reverse the slug to name?
    slugToName = slug.gsub('-', ' ').gsub(/\w+/, &:capitalize)
    # slug = slug.gsub(/\w+/, &:capitalize)


    Artist.where(name: slugToName).first
    # binding.pry

  end

end
