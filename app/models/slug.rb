module Slugging
  module InstanceMethods

    def slug
      self.name.gsub(/[\s,']/,"-").downcase
    end

  end

  module ClassMethods

    def find_by_slug(name)
      self.all.find do |t|
        t.slug == name
      end
    end
  end
end
