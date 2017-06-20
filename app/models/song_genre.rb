class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre

  def slug
    self.name.gsub(/\W/, '-').downcase
  end

  def self.find_by_slug(slug)
    SongGenre.all.select do |song_genres|
      song_genres if song_genres.slug == slug
    end.first
  end
end
