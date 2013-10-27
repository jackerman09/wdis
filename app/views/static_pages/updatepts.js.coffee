# console.log('in updatepts.js')

######################################################################
# Functions that will be called below
######################################################################

delay = (ms, func) -> setTimeout func, ms

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

updateCurrentMatchupVote = ->
	$('#mpts1').find('h2').html('<%= @matchup.send("pts_player_1_week_#{current_week}") %>')
	$('#mpts2').find('h2').html('<%= @matchup.send("pts_player_2_week_#{current_week}") %>')
	$('#num-votes-row').slideDown(500)

updateCurrentCredits = ->
	if '<%= @user %>'
		# if the user is signed in
		# console.log('update user credits in updatepts.js')
		$('#credit-counter-value').text('<% if @user %><%= @user.num_credits %><% end %>')
	else
		# console.log('update cookie credits in updatepts.js')
		$('#credit-counter-value').text(getNumCookieCredits())

######################################################################
######################################################################

# Update the div showing the number of votes for the current matchup and show it
updateCurrentMatchupVote()

# Update the number of credits belonging to the user
updateCurrentCredits()

# Call getRandomMatchup to put a new matchup on the home page
delay 1500, ->
	$('#matchupcontainer').fadeOut()
	$('div.container div.alert').slideUp(1000)
	# console.log('about to make ajax call to getRandomMatchup')
	$.ajax({ 
	  url: '/getRandomMatchup'
	  type: 'get'
	  })