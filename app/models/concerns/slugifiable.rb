module Slugs

  module InstanceMethods
    def slug
      self.name.gsub(' ', '-').downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      #take a slug "taylor-swift" and returns class artist instace with matching name
      #first need to turn slug into nonslug
      #nonslug = slug.gsub('-', ' ').split.collect{ |word| word.capitalize}.join(' ')
      #don't use self.class.all as its already in class scope
      #need to use find_by or as find does wierd id.name=nonslug ... not sure why
      #self.all.find_by(name: nonslug)
      #the above does not get the case sensitivty right
      #as in "That One with the Guitar" is coming back "That One With The Guitar"
      #using this below really slows down tests
      #self.where('lower(name) = ?', nonslug.downcase).first
      self.all.find{ |i| i.slug == slug}
    end
  end

end
