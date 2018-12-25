class Helper

  def slug
    self.name.downcase.gsub ' ', '-'
  end

  def self.find_by_slug(input)
    # binding.pry
    self.all.detect {|a| a.slug == input}
  end

end
