# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	jets = Team.create(location: 'New York',			name: 'Jets'},
	dolphins = Team.create(location: 'Miami',				name: 'Dolphins'},
	patriots = Team.create(location: 'New England', 	name: 'Patriots'},
	bills = Team.create(location: 'Buffalo',			name: 'Bills'},
	giants = Team.create(location: 'New York', 		name: 'Giants'},
	eagles = Team.create(location: 'Philadelphia',	name: 'Eagles'},
	cowboys = Team.create(location: 'Dallas',				name: 'Cowboys'},
	redskins = Team.create(location: 'Washington',		name: 'Redskins'},
	steelers = Team.create(location: 'Pittsburg',		name: 'Steelers'},
	bengals = Team.create(location: 'Cincinnatti',	name: 'Bengals'},
	browns = Team.create(location: 'Cleveland',		name: 'Browns'},
	ravens = Team.create(location: 'Baltimore',		name: 'Ravens'},
	packers = Team.create(location: 'Green Bay',		name: 'Packers'},
	bears = Team.create(location: 'Chicago',			name: 'Bears'},
	lions = Team.create(location: 'Detroit',			name: 'Lions'},
	vikings = Team.create(location: 'Minnesota',		name: 'Vikings'},
	colts = Team.create(location: 'Indianapolis',	name: 'Colts'},
	jaguars = Team.create(location: 'Jacksonville',	name: 'Jaguars'},
	titans = Team.create(location: 'Tennessee',		name: 'Titans'},
	texans = Team.create(location: 'Houston',			name: 'Texans'},
	buccaneers = Team.create(location: 'Tamba Bay',		name: 'Buccaneers'},
	falcons = Team.create(location: 'Atlanta',			name: 'Falcons'},
	saints = Team.create(location: 'New Orleans',	name: 'Saints'},
	panthers = Team.create(location: 'Carolina',			name: 'Panthers'},
	chiefs = Team.create(location: 'Kansas City',	name: 'Chiefs'},
	broncos = Team.create(location: 'Denver',				name: 'Broncos'},
	chargers = Team.create(location: 'San Diego',		name: 'Chargers'},
	raiders = Team.create(location: 'Oakland',			name: 'Raiders'},
	49ers = Team.create(location: 'San Francisco',name: '49ers'},
	seahawks = Team.create(location: 'Seattle',			name: 'Seahawks'},
	rams = Team.create(location: 'St. Louis',		name: 'Rams'},
	cardinals = Team.create(location: 'Arizona',			name: 'Cardinals'},
	bye = Team.create(location: '',							name: 'Bye Week'}

# Teams without RB below:
#   St. Louis
#   Arizona

players = Player.create([
	{last_name: 'Powell',			first_name: 'Bilal',			team_id: jets.id,					position: 'RB'},
	{last_name: 'Miller',			first_name: 'Lamar',			team_id: dolphins.id,			position: 'RB'},
	{last_name: 'Ridley',			first_name: 'Stevan',			team_id: patriots.id,			position: 'RB'},
	{last_name: 'Jackson',		first_name: 'Fred',				team_id: bills.id,				position: 'RB'},
	{last_name: 'Spiller',		first_name: 'C.J.',				team_id: bills.id,				position: 'RB'},
	{last_name: 'Wilson',			first_name: 'David',			team_id: giants.id,				position: 'RB'},
	{last_name: 'McCoy',			first_name: 'Lesean',			team_id: eagles.id,				position: 'RB'},
	{last_name: 'Murray',			first_name: 'DeMarco',		team_id: cowboys.id,			position: 'RB'},
	{last_name: 'Morris',			first_name: 'Alfred',			team_id: redskins.id,			position: 'RB'},
	{last_name: 'Jones',			first_name: 'Felix',			team_id: steelers.id,			position: 'RB'},
	{last_name: 'Green-Ellis',first_name: 'Ben Jarvus',	team_id: bengals.id,			position: 'RB'},
	{last_name: 'Bernard',		first_name: 'Giovani',		team_id: bengals.id,			position: 'RB'},
	{last_name: 'McGahee',		first_name: 'Willis',			team_id: bengals.id,			position: 'RB'},
	{last_name: 'Rice',				first_name: 'Ray',				team_id: ravens.id,				position: 'RB'},
	{last_name: 'Starks',			first_name: 'James',			team_id: packers.id,			position: 'RB'},
	{last_name: 'Forte',			first_name: 'Matt',				team_id: bears.id,				position: 'RB'},
	{last_name: 'Bush',				first_name: 'Reggie',			team_id: lions.id,				position: 'RB'},
	{last_name: 'Bell',				first_name: 'Joique',			team_id: lions.id,				position: 'RB'},
	{last_name: 'Peterson', 	first_name: 'Adrian', 		team_id: vikings.id,			position: 'RB'},
	{last_name: 'Richardson',	first_name: 'Trent',			team_id: colts.id,				position: 'RB'},
	{last_name: 'Jones-Drew',	first_name: 'Maurice',		team_id: jaguars.id,			position: 'RB'},
	{last_name: 'Johnson',		first_name: 'Chris',			team_id: titans.id,				position: 'RB'},
	{last_name: 'Foster',			first_name: 'Arian',			team_id: texans.id,				position: 'RB'},
	{last_name: 'Martin',			first_name: 'Doug',				team_id: buccaneers.id,		position: 'RB'},
	{last_name: 'Jackson',		first_name: 'Steven',			team_id: falcons.id,			position: 'RB'},
	{last_name: 'Sproles',		first_name: 'Darren',			team_id: saints.id,				position: 'RB'},
	{last_name: 'Williams',		first_name: 'DeAngelo',		team_id: panthers.id,			position: 'RB'},
	{last_name: 'Charles',		first_name: 'Jamaal',			team_id: chiefs.id,				position: 'RB'},
	{last_name: 'Moreno',			first_name: 'Knowshon',		team_id: broncos.id,			position: 'RB'},
	{last_name: 'Matthews',		first_name: 'Ryan',				team_id: chargers.id,			position: 'RB'},
	{last_name: 'McFadden',		first_name: 'Darren',			team_id: raiders.id,			position: 'RB'},
	{last_name: 'Gore', 			first_name: 'Frank', 			team_id: 49ers.id,				position: 'RB'},
	{last_name: 'Lynch',			first_name: 'Marshawn',		team_id: seahawks.id,			position: 'RB'}
	{last_name: 'Richardson',	first_name: 'Daryl',			team_id: rams.id,					position: 'RB'},
	{last_name: 'Mendenhall',	first_name: 'Rashard',		team_id: cardinals.id,		position: 'RB'},
	])

admin =	User.create(name: 'Jason Ackerman',		email: 'jackerman09@gmail.com', password: 'railstutorial', password_confirmation: 'railstutorial', admin: true)
user =	User.create(name: 'Jessica Smagler',	email: 'jbsmags@aol.com', 			password: 'railstutorial', password_confirmation: 'railstutorial', admin: false)

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
