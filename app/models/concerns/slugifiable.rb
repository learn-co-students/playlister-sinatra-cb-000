module Slugifiable
  def slug
    name.downcase.gsub(" ","-")
  end

  module Find
     def find_by_slug(data)
      self.all.find { |obj| obj.slug == data }
    end
  end
end
