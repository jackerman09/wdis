console.log('in getRandomMatchup')

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

	$('#matchupcontainer').fadeIn()

updateMatchupData()