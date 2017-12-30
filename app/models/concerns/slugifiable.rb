module Slug
  def slug
    name.downcase.gsub(" ", "-")
  end
end

module FindBySlug
  def find_by_slug(slug)
    self.all.find{|thing| thing.slug == slug}
  end
end
