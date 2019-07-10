module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      sql = "SELECT * FROM #{self.name.pluralize} WHERE name = '#{slug.gsub("-", " ")}' COLLATE NOCASE"
      self.find_by_sql(sql).first
    end
  end
end
