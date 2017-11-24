module Helpers
    module InstanceMethods
        def slug
            self.name.downcase.gsub("?", "").gsub(" ", "-")
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            self.all.detect do |obj|
                obj.slug == slug
            end
        end
    end
end