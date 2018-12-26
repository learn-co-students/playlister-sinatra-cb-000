class Helper

  def slug
    self.name.downcase.gsub ' ', '-'
  end

  def self.find_by_slug(input)
    self.all.detect {|a| a.slug == input}
  end

end
