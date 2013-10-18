jQuery ->
	######################################################################
	# Functions that will be called below
	######################################################################
	
	addClickListenersToPlayerPictures = ->
		# Add click listener to player pictures if on home page
		if $('#home-header').data('votable') == true
			# bind click event to the two player pictures
			$(document).on 'click', '.mp', pointForPlayer
			
			# add class that makes the picture 'jump' on click
			$('#mpimage1').addClass('mpimage')
			$('#mpimage2').addClass('mpimage')
			
			# don't show number of votes on home page until after vote
			$('#num-votes-row').hide()
		else
			# remove class that makes picture 'jump' on click if not on home page
			$('#mpimage1').removeClass('mpimage')
			$('#mpimage2').removeClass('mpimage')

			# show number of votes if not on home page
			$('#num-votes-row').show()

	# Increase the votes of the clicked player and the number of credits of the cookies/user
	pointForPlayer = (e) ->
		e.preventDefault()
		
		# get matchup id from DOM to provide to controller via my_data
		matchupid = $('#matchupID').data('matchupid')

		# determine which picture was clicked and tell the controller which player was voted for
		if e.currentTarget.id == 'mp1'
			player1or2 = 1
		else
			player1or2 = 2
		
		my_data = 
			matchupid:		matchupid
			player1or2:		player1or2

		$.ajax({ 
		  url: '/updatepts'
		  type: 'get'
		  data: my_data
		  })	

	# Get the number of credits from the browser's cookies
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

	# Get the number of credits from user if signed in, if not, from cookies
	getNumCredits = ->
		unless $('#account-link').text() != ''
			console.log('getting cookie credits')
			getNumCookieCredits()

######################################################################
######################################################################

	# Update number of credits in header on page load
	$('#credit-counter-value').text(getNumCredits())

	addClickListenersToPlayerPictures()

