module Slugifiable
  def self.included(base)
   # base is our target class. Invoke `extend` on it and pass nested module with class methods.
   base.extend ClassMethods
 end

  def slug
    self.name.downcase.gsub(/[(\W)]/, '-')
  end

  module ClassMethods

    def find_by_slug(slug)
      t = slug.gsub(/[(\W)]/, ' ').split
      t = t.map.with_index do |g,i|
        if i == 0
          g.capitalize
        elsif g == "with"
          g
        elsif g == "the"
          g
        elsif g == "a"
          g
        else
          g.capitalize
        end
      end
      t = t.join(' ')
      self.find_by name: t
    end
  end
end
