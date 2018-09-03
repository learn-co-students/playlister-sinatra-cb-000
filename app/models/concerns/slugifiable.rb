module Slugifiable

  module InstanceMethods
    def slug
        self.name.downcase.split.join("-")
    end
  end

  module ClassMethods

    def find_by_slug(slug)
      slug = slug.split("-").collect{|c| c.capitalize}
      unslug = slug.join(" ")
      self.all.detect{|a| a.name == unslug}
    end

  end

end
