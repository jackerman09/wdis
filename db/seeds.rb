# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
teams = Team.create(name: 'Jets')
players = Player.create(
	[last_name: 'Gore', first_name: 'Frank', team_id: 1],
	[last_name: 'Peterson', first_name: 'Adrian', team_id: 1],
	)
matchups = Matchup.create(player_1: 1, player_2: 2)
users = User.create(name: 'Jason Ackerman', email: 'jackerman09@gmail.com', password: 'railstutorial', password_confirmation: 'railstutorial', admin: true)
