# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Cleaning the database
Vinyl.destroy_all
User.destroy_all
Genre.destroy_all
Artist.destroy_all
Booking.destroy_all
Review.destroy_all
Track.destroy_all

#Generating 4 fake users
puts 'Creating Users'
marco = User.create(pseudo:'MarcoFullStack', address:'19 rue Nationale, 59800 Lille', email:'marc.combarel@edhec.com', password:'azerty')
User.create(pseudo:'Dourtealacreme', address:'53 rue de la Barre, 59800 Lille', email:'augustin.dortu@edhec.com', password:'azerty')
User.create(pseudo:'Pedro', address:'24 rue de Londres, 75000 Paris', email:'pierre.debilbao@edhec.com', password:'azerty')
djbaz = User.create(pseudo:'DJBaz', address:'89 rue de Lille, 77300 Melun', email:'basile.masson@edhec.com', password:'azerty')


#Generating all Artists
puts 'Creating Artists'
Artist.create(name:'Rolling Stones')
michael = Artist.create(name:'Michael Jackson')
Artist.create(name:'BTS')
miles = Artist.create(name:'Miles Davis')
Artist.create(name:'Eminem')
Artist.create(name:'Bob Marley')
Artist.create(name:'Vivaldi')


#Generating main Genres
puts 'Creating Genres'
Genre.create(name:'Disco')
Genre.create(name:'Blues')
Genre.create(name:'Funk')
jazz = Genre.create(name:'Jazz')
Genre.create(name:'Metal')
pop = Genre.create(name:'Pop')
Genre.create(name:'Punk')
Genre.create(name:'Rap')
Genre.create(name:'Rock')
Genre.create(name:'Country')
Genre.create(name:'Reggae')
Genre.create(name:'Afro')
Genre.create(name:'Raï')
Genre.create(name:'Ska')
Genre.create(name:'Gospel')
Genre.create(name:'Soul')
Genre.create(name:'Kompa')
Genre.create(name:'Classique')
Genre.create(name:'RnB')
Genre.create(name:'Electro')
Genre.create(name:'K-pop')
Genre.create(name:'Zouk')
Genre.create(name:'Makossa')
Genre.create(name:'Musique Indi')
Genre.create(name:'Musique Latino')

#Generating all Vinyls
puts 'Creating Vinyls'
AbbeyRoad = Vinyl.create(name:'AbbeyRoad', release_date: '1986', price_per_day: 3, user: marco, artist: miles, genre: jazz, address: 'lille')
Bad = Vinyl.create(name:'Bad', release_date: '1987', price_per_day: 5, user: djbaz, artist: michael, genre: pop, address: '146 rue nationale lille')
Good = Vinyl.create(name:'Bad', release_date: '1987', price_per_day: 5, user: djbaz, artist: michael, genre: pop, address: '52 rue de la clef lille')
Toto = Vinyl.create(name:'Bad', release_date: '1987', price_per_day: 5, user: djbaz, artist: michael, genre: pop, address: '119 rue nationale lille')
Tutu = Vinyl.create(name:'Bad', release_date: '1987', price_per_day: 5, user: djbaz, artist: michael, genre: pop, address: 'République lille')
Tata = Vinyl.create(name:'Bad', release_date: '1987', price_per_day: 5, user: djbaz, artist: michael, genre: pop, address: 'rue bartholome masurel lille ')
Touraine = Vinyl.create(name:'Bad', release_date: '1987', price_per_day: 5, user: djbaz, artist: michael, genre: pop, address: '06 rue nationale lille')
Mike = Vinyl.create(name:'Bad', release_date: '1987', price_per_day: 5, user: djbaz, artist: michael, genre: pop, address: 'quai du wault lille')





#Generating all Tracks
puts 'Creating Tracks'
Track.create(name: 'Tutu', vinyl: AbbeyRoad)
Track.create(name: 'Tomaas', vinyl: AbbeyRoad)
Track.create(name: 'Portia', vinyl: AbbeyRoad)
Track.create(name: 'Splatch', vinyl: AbbeyRoad)
Track.create(name: 'Backyard Ritual', vinyl: AbbeyRoad)
Track.create(name: 'Perfect Way', vinyl: AbbeyRoad)

Track.create(name: 'Bad', vinyl: Bad)
Track.create(name: 'The Way You Make Me Feel', vinyl: Bad)
Track.create(name: 'Speed Demon', vinyl: Bad)
Track.create(name: 'Smooth Criminal', vinyl: Bad)
Track.create(name: 'Leave Me Alone', vinyl: Bad)

#Generating all Bookings
puts 'Creating Bookings'
first_booking = Booking.create(start_rent: Time.now - 20, end_rent: Time.now, vinyl:AbbeyRoad, user: marco)

#Generating all Reviews
puts 'Creating Reviews'
Review.create(comment:'That was awsome, great quality', rating: 4, booking: first_booking)
Review.create(comment:'That was ok', rating: 3, booking: first_booking)
