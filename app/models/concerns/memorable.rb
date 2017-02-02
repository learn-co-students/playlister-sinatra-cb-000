module Memorable
  module ClassMethods
    def find_by_slug(slug)
      #these are our conjunctions for the test
      c = %w(with a the)
      slug = slug.split("-").map {|e| c.include?(e) ? e : e.capitalize}    
      self.find_by(name: slug.join(" "))
    end
  end

  module InstanceMethods
    def slug
      self.name.downcase.gsub(/\s/,"-")
    end
  end
end