# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
30.times do |i|
  player = Player.create(name: Faker::BossaNova.artist)
  #save a invalid object
  if i == 15
    album = Album.new(name: "", player_id: player.id)
    album.save(validate: false)
  else
    Album.create(name: Faker::BossaNova.song, player_id: player.id)
  end
end