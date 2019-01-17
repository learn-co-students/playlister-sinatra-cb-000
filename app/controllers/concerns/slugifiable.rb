
def slugify(slug)
  spots = slug.length
  dex = 0
  ray = slug.split("")
  ray.each do |spot|
    if spot == " "
      ray[dex] = "-"
    end
    dex += 1
  end
  value = ray.join
end



def deslugify(slug)
  spots = slug.length
  dex = 0
  ray = slug.split("")
  ray.each do |spot|
    if spot == "-"
      ray[dex] = " "
    end
    dex += 1
  end
  value = ray.join
end

#puts deslugify("butt-hole")
