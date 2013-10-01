jQuery ->
	# Increase the votes of the clicked player and the number of credits of the cookies/user
	pointForPlayer = (e) ->
		e.preventDefault()
		matchupid = $('#matchupID').data('matchupid')
		
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
		  success: (data,status,xhr) ->
		    $('#mpts1').find('h2').html(data.new_player_1_pts)
		    $('#mpts2').find('h2').html(data.new_player_2_pts)

		    if $('#account-link').text() != ''
		    	# if the user is signed in
		    	$('#credit-counter-value').text(data.user_credits)
		    else
		    	$('#credit-counter-value').text(getNumCookieCredits())
		  error: (xhr,status,error) ->
		    console.log(xhr)
		    alert(error)
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

	# Get the number of credits from the signed in user's model
	getNumUserCredits = ->
		$.ajax({ 
		  url: '/getUserNumCredits'
		  type: 'get'
		  success: (data,status,xhr) ->
		    if $('#account-link').text() != ''
		    	# if the user is signed in
		    	$('#credit-counter-value').text(data.user_credits)
		  error: (xhr,status,error) ->
		    console.log(xhr)
		    alert(error)
		  })

	# Get the number of credits from user if signed in, if not, from cookies
	getNumCredits = ->
		if $('#account-link').text() != ''
			getNumUserCredits()
		else
			getNumCookieCredits()

	# Update number of credits in header on page load
	$('#credit-counter-value').text(getNumCredits)

	# Add click listener to player pictures
	if $('#home-header').data('votable') == true
		$('#mp1').click pointForPlayer
		$('#mpimage1').addClass('mpimage')
		$('#mp2').click pointForPlayer
		$('#mpimage2').addClass('mpimage')
	else
		$('#mpimage1').removeClass('mpimage')
		$('#mpimage2').removeClass('mpimage')