require 'pry'

module Slugifiable
    def slug
      self.name.downcase.gsub(/[!@#$%^&"-+= ]/, "-")
    end
end

module ClassSlugifiable
    def find_by_slug(slug)
      slug = slug.split("-").map(&:capitalize).join(" ")
      self.find_by(name: slug)
    end
end