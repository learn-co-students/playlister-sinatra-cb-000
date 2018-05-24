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
ball_for_me = Song.create(name: 'Ball For Me').genres << trap_music << rb << hip_hop << rap
psycho = Song.create(name: 'Psycho').genres << trap_music << rb << hip_hop
zack_and_codeine = Song.create(name: 'Zack And Codeine').genres << trap_music << rb << hip_hop
rockstar = Song.create(name: 'rockstar').genres << trap_music << rb << hip_hop
post_malone.songs << ball_for_me << psycho << zack_and_codine << rockstar

the_night_is_still_young = Song.create(name: 'The Night Is Still Young').genres << pop << rap
moment_4_life = Song.create(name: 'Moment 4 Life').genres << rap << hip_hop << pop << rb
anaconda = Song.create(name: 'Anaconda').genres << rap << hip_hop
chun_li = Song.create(name: 'Chun-Li').genres << rap << hip_hop
grand_piano = Song.create(name: 'Grand Piano').genres << pop
nicki_minaj.songs << the_night_is_still_young << moment_4_life << anaconda << chun_li << grand_piano

sorry = Song.create(name: 'Sorry').genres << rb << hip_hop
halo = Song.create(name: 'Halo').genres << pop << rb
formation = Song.create(name: 'Formation').genres << rb << hip_hop
check_on_it = Song.create(name: 'Check On It').genres << rb << hip_hop << pop
beyonce.songs << sorry << halo << formation << check_on_it

be_careful = Song.create(name: 'Be Careful').genres << rap << hip_hop << pop
bodak_yellow = Song.create(name: 'Bodak Yellow').genres << rap << hip_hop
money_bag = Song.create(name: 'Money Bag').genres << rap << hip_hop
cardi_b.songs << be_careful << bodak_yellow << money_bag

honest = Song.create(name: 'Honest').genres << pop << rb
mine = Song.create(name: 'Mine').genres << pop << rb
beautiful = Song.create(name: 'Beautiful').genres << pop << rb
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
