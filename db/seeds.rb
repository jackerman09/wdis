# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# teams = Team.create([
# 	{location: 'New York',			name: 'Jets'},
# 	{location: 'Miami',					name: 'Dolphins'},
# 	{location: 'New England', 	name: 'Patriots'},
# 	{location: 'Buffalo',				name: 'Bills'},
# 	{location: 'New York', 			name: 'Giants'},
# 	{location: 'Philadelphia',	name: 'Eagles'},
# 	{location: 'Dallas',				name: 'Cowboys'},
# 	{location: 'Washington',		name: 'Redskins'},
# 	{location: 'Pittsburg',			name: 'Steelers'},
# 	{location: 'Cincinnatti',		name: 'Bengals'},
# 	{location: 'Cleveland',			name: 'Browns'},
# 	{location: 'Baltimore',			name: 'Ravens'},
# 	{location: 'Green Bay',			name: 'Packers'},
# 	{location: 'Chicago',				name: 'Bears'},
# 	{location: 'Detroit',				name: 'Lions'},
# 	{location: 'Minnesota',			name: 'Vikings'},
# 	{location: 'Indianapolis',	name: 'Colts'},
# 	{location: 'Jacksonville',	name: 'Jaguars'},
# 	{location: 'Tennessee',			name: 'Titans'},
# 	{location: 'Houston',				name: 'Texans'},
# 	{location: 'Tamba Bay',			name: 'Buccaneers'},
# 	{location: 'Atlanta',				name: 'Falcons'},
# 	{location: 'New Orleans',		name: 'Saints'},
# 	{location: 'Carolina',			name: 'Panthers'},
# 	{location: 'Kansas City',		name: 'Chiefs'},
# 	{location: 'Denver',				name: 'Broncos'},
# 	{location: 'San Diego',			name: 'Chargers'},
# 	{location: 'Oakland',				name: 'Raiders'},
# 	{location: 'San Francisco', name: '49ers'},
# 	{location: 'Seattle',				name: 'Seahawks'},
# 	{location: 'St. Louis',			name: 'Rams'},
# 	{location: 'Arizona',				name: 'Cardinals'},
# 	{location: '',							name: 'Bye Week'}
# 	])

# Teams without RB below:
  # Pittsburg
  # Cleveland
  # Detroit
  # Carolina
  # Chargers
  # St. Louis
  # Arizona

# players = Player.create([
# 	{last_name: 'Powell',			first_name: 'Bilal',			team_id: Team.find_by(name: 'Jets').id,					position: 'RB'},
# 	{last_name: 'Miller',			first_name: 'Lamar',			team_id: Team.find_by(name: 'Dolphins').id,			position: 'RB'},
# 	{last_name: 'Ridley',			first_name: 'Stevan',			team_id: Team.find_by(name: 'Patriots').id,			position: 'RB'},
# 	{last_name: 'Jackson',		first_name: 'Fred',				team_id: Team.find_by(name: 'Bills').id,				position: 'RB'},
# 	{last_name: 'Spiller',		first_name: 'C.J.',				team_id: Team.find_by(name: 'Bills').id,				position: 'RB'},
# 	{last_name: 'Wilson',			first_name: 'Davis',			team_id: Team.find_by(name: 'Giants').id,				position: 'RB'},
# 	{last_name: 'McCoy',			first_name: 'Lesean',			team_id: Team.find_by(name: 'Eagles').id,	position: 'RB'},
# 	{last_name: 'Murray',			first_name: 'DeMarco',		team_id: Team.find_by(name: 'Cowboys').id,			position: 'RB'},
# 	{last_name: 'Morris',			first_name: 'Alfred',			team_id: Team.find_by(name: 'Redskins').id,			position: 'RB'},
# 	{last_name: 'Green-Ellis',first_name: 'Ben Jarvus',	team_id: Team.find_by(name: 'Bengals').id,			position: 'RB'},
# 	{last_name: 'Rice',				first_name: 'Ray',				team_id: Team.find_by(name: 'Ravens').id,				position: 'RB'},
# 	{last_name: 'Starks',			first_name: 'James',			team_id: Team.find_by(name: 'Packers').id,			position: 'RB'},
# 	{last_name: 'Forte',			first_name: 'Matt',				team_id: Team.find_by(name: 'Bears').id,				position: 'RB'},
# 	{last_name: 'Peterson', 	first_name: 'Adrian', 		team_id: Team.find_by(name: 'Vikings').id,			position: 'RB'},
# 	{last_name: 'Richardson',	first_name: 'Trent',			team_id: Team.find_by(name: 'Colts').id,				position: 'RB'},
# 	{last_name: 'Jones-Drew',	first_name: 'Maurice',		team_id: Team.find_by(name: 'Jaguars').id,			position: 'RB'},
# 	{last_name: 'Johnson',		first_name: 'Chris',			team_id: Team.find_by(name: 'Titans').id,				position: 'RB'},
# 	{last_name: 'Foster',			first_name: 'Arian',			team_id: Team.find_by(name: 'Texans').id,				position: 'RB'},
# 	{last_name: 'Martin',			first_name: 'Doug',				team_id: Team.find_by(name: 'Buccaneers').id,		position: 'RB'},
# 	{last_name: 'Jackson',		first_name: 'Steven',			team_id: Team.find_by(name: 'Falcons').id,			position: 'RB'},
# 	{last_name: 'Sproles',		first_name: 'Darren',			team_id: Team.find_by(name: 'Saints').id,				position: 'RB'},
# 	{last_name: 'Charles',		first_name: 'Jamaal',			team_id: Team.find_by(name: 'Chiefs').id,				position: 'RB'},
# 	{last_name: 'Moreno',			first_name: 'Knowshon',		team_id: Team.find_by(name: 'Broncos').id,			position: 'RB'},
# 	{last_name: 'McFadden',		first_name: 'Darren',			team_id: Team.find_by(name: 'Raiders').id,			position: 'RB'},
# 	{last_name: 'Gore', 			first_name: 'Frank', 			team_id: Team.find_by(name: '49ers').id,				position: 'RB'},
# 	{last_name: 'Lynch',			first_name: 'Marshawn',		team_id: Team.find_by(name: 'Seahawks').id,			position: 'RB'}
# 	])

# admin =	User.create(name: 'Jason Ackerman',		email: 'jackerman09@gmail.com', password: 'railstutorial', password_confirmation: 'railstutorial', admin: true)
# user =	User.create(name: 'Jessica Smagler',	email: 'jbsmags@aol.com', 			password: 'railstutorial', password_confirmation: 'railstutorial', admin: false)

players = Player.all
matchups = []
players.each do |player1|
	players.each do |player2|
		if player1.id != player2.id
			matchup = { player_1: player1.id, player_2: player2.id }
			matchups.push matchup
		end
	end
end

Matchup.create(matchups)
