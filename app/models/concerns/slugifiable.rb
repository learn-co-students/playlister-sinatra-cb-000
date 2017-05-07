module Slugifiable
  module InstanceMethods
    def slug
      name.gsub(/ +/, '-').downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug_str)
      deslugfied_string = slug_str.gsub('-', ' ')
      where("lower(name) = ?", deslugfied_string).first
    end
  end
end
