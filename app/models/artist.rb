class Artist < ActiveRecord::Base
    include Helpers::InstanceMethods
    extend Helpers::ClassMethods

    has_many :songs
    has_many :genres, through: :songs
end