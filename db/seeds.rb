# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
team = Team.create(name: 'Jets')
player1 = Player.create(last_name: 'Gore', first_name: 'Frank', team_id: team.id, position: 'RB')
player2 = Player.create(last_name: 'Peterson', first_name: 'Adrian', team_id: team.id, position: 'RB')
matchup = Matchup.create(player_1: player1.id, player_2: player2.id)
user = User.create(name: 'Jason Ackerman', email: 'jackerman09@gmail.com', password: 'railstutorial', password_confirmation: 'railstutorial', admin: true)
