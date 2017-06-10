module Slugable

  module Class_methods

    def find_by_slug(slug)
      found = self.all.detect {|obj|  obj.slug == slug}
    end
  end

  module Instance_methods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

end
