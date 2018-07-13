module SlugThis
  module ClassMethods
      def find_by_slug(slug)
        self.all.find do |ob|
          ob.slug == slug
        end
      end
    end

    module InstanceMethods
      def slug
        self.name.downcase.gsub(/\W/, '-')
      end
    end
end
