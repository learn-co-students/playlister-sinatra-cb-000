module Slugifiable

  module SlugInstance
    def slug
      self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end

  module SlugClass
    def find_by_slug(slug)
      self.all.select{|s| s.slug == slug}.first
    end
  end

end
