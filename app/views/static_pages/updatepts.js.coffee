console.log('in updatepts.js')

console.log('data: <%= @player1.full_name %>')

updateMatchupData = ->
	$('#num-votes-row').hide()
	
	$('#mp1 h3').html('<%= @player1.full_name %>')

	$('#mp1 h4').html('')
	'<% if Team.find(@player1.team.send("opp_week_#{current_week}")).send("home_week_#{current_week}") == false %>'
	$('#mp1 h4').html('@ ')
	'<% end %>'
	$('#mp1 h4').append('<%= Team.find(@player1.team.send("opp_week_#{current_week}")).name %>')

	$('#mpimage1').html('<%= image_tag(@player1.image_name, alt: @player1.image_name, class: "playerpic") %>')

	$('#mp2 h3').html('<%= @player2.full_name %>')

	$('#mp2 h4').html('')
	'<% if Team.find(@player2.team.send("opp_week_#{current_week}")).send("home_week_#{current_week}") == false %>'
	$('#mp2 h4').html('@ ')
	'<% end %>'
	$('#mp2 h4').append('<%= Team.find(@player2.team.send("opp_week_#{current_week}")).name %>')

	$('#mpimage2').html('<%= image_tag(@player2.image_name, alt: @player2.image_name, class: "playerpic") %>')



# getFullMatchupHTML = ->
# 	fullMatchupHtml = 
# 	'<div class="row">' +
# 	'<div id="matchupID" data-matchupid=<%= @matchup.id %>></div>' +
# 	'<div id="mpcontainer" class="">' +
# 	'<div id="mp1" class="span5 mp">' +
# 	'<h3><%= @player1.full_name %></h3>' +
# 	'<h4><%= Team.find(@player1.team.send("opp_week_#{current_week}")).name %></h4>' +
# 	'<div id="mpimage1" class="mpimage">' +
# 	'<%= image_tag(@player1.image_name, alt: @player1.image_name, class: "playerpic") %>'	
# 	'</div>' +
# 	'</div>' +
# 	'<div id="mp2" class="span5 mp">' +
# 	'<h3><%= @player2.full_name %></h3>' +
# 	'<h4><%= Team.find(@player2.team.send("opp_week_#{current_week}")).name %></h4>' +
# 	'<div id="mpimage2" class="mpimage">' +
# 	'<%= image_tag(@player2.image_name, alt: @player2.image_name, class: "playerpic") %>'	
# 	'</div>' +
# 	'</div>' +
# 	'</div>' +
# 	'</div>' +
# 	'</br>' +
# 	'<div class="row" id="num-votes-row" class="hiddenVoteRow">' +
# 	'<div class="">' +
# 	'<div id="mpts1" class="span5">' +
# 	'<h2><%= @matchup.send("pts_player_1_week_#{current_week}") %></h2>' +
# 	'</div>' +
# 	'<div id="mpts2" class="span5">' +
# 	'<h2><%= @matchup.send("pts_player_2_week_#{current_week}") %></h2>' +
# 	'</div>' +
# 	'</div>' +
# 	'</div>'

getNumCookieCredits = ->
	allCookies = document.cookie.split(';')
	for c in allCookies
		if c.substring(0,12) == ' num_credits'
			num_credits_cookie = c
			num_credits_value = num_credits_cookie.substring(num_credits_cookie.indexOf('=') + 1)
			num_credits_number = parseInt(num_credits_value, 10)
		else if c.substring(0,11) == 'num_credits'
			num_credits_cookie = c
			num_credits_value = num_credits_cookie.substring(num_credits_cookie.indexOf('=') + 1)
			num_credits_number = parseInt(num_credits_value, 10)
	return num_credits_number

console.log('updatepts.js thinks current_week = ' + '<%= current_week %>')
console.log('pts_player_1 = <%= @matchup.send("pts_player_1_week_#{current_week}") %>')

$('#mpts1').find('h2').html('<%= @matchup.send("pts_player_1_week_#{current_week}") %>')
$('#mpts2').find('h2').html('<%= @matchup.send("pts_player_2_week_#{current_week}") %>')

# if '<%= @user %>'
# 	# if the user is signed in
# 	console.log('update user credits in updatepts.js')
# 	$('#credit-counter-value').text('<%= @user.num_credits %>')
# else
# 	console.log('update cookie credits in updatepts.js')
# 	$('#credit-counter-value').text(getNumCookieCredits())

$('#num-votes-row').slideDown(500)
delay = (ms, func) -> setTimeout func, ms

# $('#matchupcontainer').html(getFullMatchupHTML())
delay 1500, ->
	updateMatchupData()

# delay 1500, ->
# 	$('#matchupcontainer').fadeOut()
# 	delay 500, ->
# 		$('#matchupcontainer').html(getFullMatchupHTML())
# 		delay 700, ->
# 			$('#matchupcontainer').fadeIn()


# Add click listener to player pictures
# addClickListenersToPlayerPictures = ->
# 	console.log('click listeners added from updatepts.js')
# 	if $('#home-header').data('votable') == true
# 		$('#mp1').click pointForPlayer
# 		$('#mpimage1').addClass('mpimage')
# 		$('#mp2').click pointForPlayer
# 		$('#mpimage2').addClass('mpimage')
# 		$('#num-votes-row').hide()
# 	else
# 		$('#mpimage1').removeClass('mpimage')
# 		$('#mpimage2').removeClass('mpimage')
# 		$('#num-votes-row').show()