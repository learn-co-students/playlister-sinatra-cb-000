class Artist < ActiveRecord::Base
    include Slugifiable
    extend ClassSlugifiable

    has_many :songs
    has_many :genres, through: :songs
end