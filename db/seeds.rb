require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Cleaning the database
puts 'Cleaning database for seeding'
Vinyl.destroy_all
User.destroy_all
Genre.destroy_all
Artist.destroy_all
Booking.destroy_all
Review.destroy_all
Track.destroy_all
p 'Database clean'

#Generating 4 fake users
puts 'Creating Users'
marco   = User.create(pseudo:'MarcoFullStack', address:'19 rue Nationale, 59800 Lille',                                 email:'marc.combarel@edhec.com',   password:'azerty')
dourte  = User.create(pseudo:'Dourtealacreme', address:'53 rue de la Barre, 59800 Lille',                               email:'augustin.dortu@edhec.com',  password:'azerty')
pedro   = User.create(pseudo:'Pedro',          address:'24 rue de Londres, 75000 Paris',                                email:'pierre.debilbao@edhec.com', password:'azerty')
djbaz   = User.create(pseudo:'DJBaz',          address:'89 rue de Lille, 77300 Melun',                                  email:'basile.masson@edhec.com',   password:'azerty')
ricardo = User.create(pseudo:'Ricardo',        address:'Eichenstraße 4, 12435 Berlin, Allemagne',                       email:'ricardo@test.com',          password:'azerty')
carl    = User.create(pseudo:'Carl Cox',       address:'77A Charterhouse St, Farringdon, London EC1M 6HJ, Royaume-Uni', email:'carl@test.com',             password:'azerty')
octave  = User.create(pseudo:'Octave',         address:'712 Cass Ave, Detroit, MI 48226, États-Unis',                   email:'octave@test.com',           password:'azerty')
giorgo  = User.create(pseudo:'Giorgo',         address:'Piazza del Colosseo, 1, 00184 Roma RM, Italie',                 email:'giorgo@test.com',           password:'azerty')
nyw     = User.create(pseudo:'NY Wannabe DJ',  address:'315 Ten Eyck St, Brooklyn, NY 11206, États-Unis',               email:'nyw@test.com',              password:'azerty')
p User.all
p "Users created"

#Generating all Artists
puts 'Creating Artists'
stones   = Artist.create(name:'Rolling Stones')
michael  = Artist.create(name:'Michael Jackson')
bts      = Artist.create(name:'BTS')
miles    = Artist.create(name:'Miles Davis')
eminem   = Artist.create(name:'Eminem')
bob      = Artist.create(name:'Bob Marley')
vivaldi  = Artist.create(name:'Vivaldi')
beattles = Artist.create(name:'The Beattles')
p Artist.all
p "Artists created"

#Generating main Genres
puts 'Creating Genres'
disco     = Genre.create(name:'Disco')
blues     = Genre.create(name:'Blues')
funk      = Genre.create(name:'Funk')
jazz      = Genre.create(name:'Jazz')
metal     = Genre.create(name:'Metal')
pop       = Genre.create(name:'Pop')
punk      = Genre.create(name:'Punk')
rap       = Genre.create(name:'Rap')
rock      = Genre.create(name:'Rock')
country   = Genre.create(name:'Country')
reggae    = Genre.create(name:'Reggae')
afro      = Genre.create(name:'Afro')
rai       = Genre.create(name:'Raï')
ska       = Genre.create(name:'Ska')
gospel    = Genre.create(name:'Gospel')
soul      = Genre.create(name:'Soul')
kompa     = Genre.create(name:'Kompa')
classique = Genre.create(name:'Classique')
rnb       = Genre.create(name:'RnB')
electro   = Genre.create(name:'Electro')
kpop      = Genre.create(name:'K-pop')
zouk      = Genre.create(name:'Zouk')
makossa   = Genre.create(name:'Makossa')
indi      = Genre.create(name:'Musique Indi')
latino    = Genre.create(name:'Musique Latino')
p Genre.all
p 'Genres created'

#Generating photos
abbeyroad_album = URI.open('https://images-na.ssl-images-amazon.com/images/I/919WO8q-nnL._SL1500_.jpg')
bad_album       = URI.open('https://cdn.shopify.com/s/files/1/1133/9398/products/Michael_Jackson_Bad_2048x.jpg?v=1540833212')
sticky_album    = URI.open('https://images-na.ssl-images-amazon.com/images/I/81q9fp5aTVL._SL1400_.jpg')
wings_album     = URI.open('https://ih1.redbubble.net/image.352661371.9988/flat,750x1000,075,f.u1.jpg')
tutu_album      = URI.open('https://img.discogs.com/ueTQmfHqJljxhIZN6CMXOx4o7ew=/fit-in/600x597/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-670021-1526825258-4231.jpeg.jpg')
encore_album    = URI.open('https://s.hdnux.com/photos/10/13/45/2144589/5/920x920.jpg')
legend_album    = URI.open('https://media.senscritique.com/media/000004841497/source_big/Legend_The_Best_of_Bob_Marley_and_The_Wailers_Compilation.jpg')
concerto_album  = URI.open('https://m.media-amazon.com/images/I/A1wwRtO-RgL._SS500_.jpg')


#Generating all Vinyls
puts 'Creating Vinyls'
abbeyroad     = Vinyl.create(name:'Abbey Road',                   release_date: '01/01/1986', price_per_day: 3,    user: marco,   artist: beattles, genre: rock,      address: marco.address)
abbeyroad.photo.attach(io: abbeyroad_album, filename: 'abbeayroad.png', content_type: 'image/png')

bad           = Vinyl.create(name:'Bad',                          release_date: '01/01/1987', price_per_day: 5,    user: djbaz,   artist: michael,  genre: pop,       address: djbaz.address)
bad.photo.attach(io: bad_album, filename: 'bad.png', content_type: 'image/png')

stickyfingers = Vinyl.create(name:'Sticky Fingers',               release_date: '01/01/1971', price_per_day: 2,    user: pedro,   artist: stones,   genre: rock,      address: pedro.address)
stickyfingers.photo.attach(io: sticky_album, filename: 'strickyfingers.png', content_type: 'image/png')

wings         = Vinyl.create(name:'Wings',                        release_date: '01/01/2016', price_per_day: 3.99, user: dourte,  artist: bts,      genre: electro,   address: dourte.address)
wings.photo.attach(io: wings_album, filename: 'wings.png', content_type: 'image/png')

tutu          = Vinyl.create(name:'Tutu',                         release_date: '01/01/1986', price_per_day: 10,   user: ricardo, artist: miles,    genre: jazz,      address: ricardo.address)
tutu.photo.attach(io: tutu_album, filename: 'tutu.png', content_type: 'image/png')

encore        = Vinyl.create(name:'Encore',                       release_date: '01/01/2004', price_per_day: 0.27, user: carl,    artist: eminem,   genre: rap,       address: carl.address)
encore.photo.attach(io: encore_album, filename: 'encore.png', content_type: 'image/png')

legend        = Vinyl.create(name:'Legend',                       release_date: '01/01/1984', price_per_day: 1000, user: octave,  artist: bob,      genre: reggae,    address: octave.address)
legend.photo.attach(io: legend_album, filename: 'legend.png', content_type: 'image/png')

concerto      = Vinyl.create(name:'Concert pour Violon op.8 n°1', release_date: '01/01/1703', price_per_day: 5,    user: giorgo,  artist: vivaldi,  genre: classique, address: giorgo.address)
concerto.photo.attach(io: concerto_album, filename: 'concerto.png', content_type: 'image/png')

p Vinyl.all
p 'Vinyls created'

#Generating all Tracks
puts 'Creating Tracks'
Track.create(name: 'Tutu',            vinyl: abbeyroad)
Track.create(name: 'Tomaas',          vinyl: abbeyroad)
Track.create(name: 'Portia',          vinyl: abbeyroad)
Track.create(name: 'Splatch',         vinyl: abbeyroad)
Track.create(name: 'Backyard Ritual', vinyl: abbeyroad)
Track.create(name: 'Perfect Way',     vinyl: abbeyroad)

Track.create(name: 'Bad',                      vinyl: bad)
Track.create(name: 'The Way You Make Me Feel', vinyl: bad)
Track.create(name: 'Speed Demon',              vinyl: bad)
Track.create(name: 'Smooth Criminal',          vinyl: bad)
Track.create(name: 'Leave Me Alone',           vinyl: bad)

p Track.all
p 'Tracks created'

#Generating all Bookings
puts 'Creating Bookings'
first_booking = Booking.create(start_rent: Time.now - 20, end_rent: Time.now, vinyl:abbeyroad, user: marco)

#Generating all Reviews
puts 'Creating Reviews'
Review.create(comment:'That was awsome, great quality', rating: 4, booking: first_booking)
Review.create(comment:'That was ok', rating: 3, booking: first_booking)
