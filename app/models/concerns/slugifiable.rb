class Slugifable
  module InstanceMethods
    def slug
      # finds and replaces white space with "-" then downcases name
      self.name.gsub(/[^a-zA-Z0-9]/, "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find { | i | i.slug == slug }
    end
  end
end
