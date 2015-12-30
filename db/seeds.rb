# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Game.delete_all
User.delete_all
UserCard.delete_all
Card.delete_all

games = Game.create([
  { name: "Game1" },
  { name: "Game2" }
])

User.create([
  { username: "Sam", game_id: games[0].id, admin: true },
  { username: "Dani", game_id: games[0].id },
  { username: "Steve", game_id: games[1].id, admin: true },
  { username: "Alex", game_id: games[1].id }
])

["Clubs", "Spades", "Hearts", "Diamonds"].each do |suit|

  Card.transaction do
    13.times do |x|
      Card.create({ value: (x+1), suit: suit })
    end
  end
end