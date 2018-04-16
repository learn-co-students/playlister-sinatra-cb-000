module Slugifiable
  module InstanceMethods
    def slug
      self.name.gsub(/[^a-zA-Z0-9 ]/, "").gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|i| i.slug == slug}
    end
  end
end
