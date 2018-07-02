module SlugThis
  module InstanceMethods
    def slug
      a_name = name.to_s.downcase
      a_name[/[a-zA-Z[:blank:][:digit:]]+/].strip.gsub(" ", "-")
      
      # [x] take the object's name
      # [x] strip out special characters
      # [x] replace all spaces w/ '-'
      # [x] returns slugified name
    end 
  end 
  
  module ClassMethods
    
    def find_by_slug(slug)
      all.find{|object| object.slug == slug}
    end
    
  end
  
end