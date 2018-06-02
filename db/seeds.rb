# Artist seeds
post_malone = Artist.create(name: "Post Malone")
nicki_minaj = Artist.create(name: "Nicki Minaj")
drake = Artist.create(name: "Drake")
beyonce = Artist.create(name: "Beyonce")
cardi_b = Artist.create(name: "Cardi B")
bazzi = Artist.create(name: "Bazzi")

# Genre seeds
hip_hop = Genre.create(name: "Hip-hop")
rap = Genre.create(name: "Rap")
pop = Genre.create(name: "Pop")
rb = Genre.create(name: "R&B")
trap_music = Genre.create(name: "Trap")

# Song seeds and associations
ball_for_me = Song.create(name: 'Ball For Me')
ball_for_me.genres << trap_music << rb << hip_hop << rap
psycho = Song.create(name: 'Psycho')
psycho.genres << trap_music << rb << hip_hop
zack_and_codeine = Song.create(name: 'Zack And Codeine')
zack_and_codeine.genres << trap_music << rb << hip_hop
rockstar = Song.create(name: 'rockstar')
rockstar.genres << trap_music << rb << hip_hop
post_malone.songs << ball_for_me << psycho << zack_and_codeine << rockstar

the_night_is_still_young = Song.create(name: 'The Night Is Still Young')
the_night_is_still_young.genres << pop << rap
moment_4_life = Song.create(name: 'Moment 4 Life')
moment_4_life.genres << rap << hip_hop << pop << rb
anaconda = Song.create(name: 'Anaconda')
anaconda.genres << rap << hip_hop
chun_li = Song.create(name: 'Chun-Li')
chun_li.genres << rap << hip_hop
grand_piano = Song.create(name: 'Grand Piano')
grand_piano.genres << pop
nicki_minaj.songs << the_night_is_still_young << moment_4_life << anaconda << chun_li << grand_piano

sorry = Song.create(name: 'Sorry')
sorry.genres << rb << hip_hop
halo = Song.create(name: 'Halo')
halo.genres << pop << rb
formation = Song.create(name: 'Formation')
formation.genres << rb << hip_hop
check_on_it = Song.create(name: 'Check On It')
check_on_it.genres << rb << hip_hop << pop
beyonce.songs << sorry << halo << formation << check_on_it

be_careful = Song.create(name: 'Be Careful')
be_careful.genres << rap << hip_hop << pop
bodak_yellow = Song.create(name: 'Bodak Yellow')
bodak_yellow.genres << rap << hip_hop
money_bag = Song.create(name: 'Money Bag')
money_bag.genres << rap << hip_hop
cardi_b.songs << be_careful << bodak_yellow << money_bag

honest = Song.create(name: 'Honest')
honest.genres << pop << rb
mine = Song.create(name: 'Mine')
mine.genres << pop << rb
beautiful = Song.create(name: 'Beautiful')
beautiful.genres << pop << rb
bazzi.songs << honest << mine << beautiful

p "Created #{Artist.count} Artists, #{Genre.count} Genres, and #{Song.count} Songs"



### methods for creation
=begin
SEEDS = []

def create(string, cap = false)
  str = string.downcase.split
  m = str.pop
  @name = str.join(" ")
  @cap = cap
  model = case m
  when 'a'
    "artist"
  when 'g'
    "genre"
  when 's'
    "song"
  end

  model.capitalize!

  def instance_name
    @name.downcase.split(" ").join("_")
  end

  def attr_name
    name = @name.split(" ").map{|w| w.capitalize}.join(" ")
    name.upcase! if @cap
    name
  end

  SEEDS << "#{instance_name()} = #{model}.create(name: '#{attr_name()}')"
  return SEEDS.last
end
=end
