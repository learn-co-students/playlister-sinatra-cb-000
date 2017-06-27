module Concerns
  module Slugifiable
    module InstanceMethods
      def slug
        self.name.gsub(/\s/, '-').gsub(/[^a-zA-Z0-9\-]/,"").downcase unless self.name.nil?
      end
    end

    module ClassMethods
      def find_by_slug(slug)
        self.find {|object| object.slug == slug}
      end
    end
  end
end
