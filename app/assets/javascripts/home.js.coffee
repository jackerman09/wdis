jQuery ->
	# Add click listener to player pictures
	addClickListenersToPlayerPictures = ->
		if $('#home-header').data('votable') == true
			$('#mp1').click pointForPlayer
			$('#mpimage1').addClass('mpimage')
			$('#mp2').click pointForPlayer
			$('#mpimage2').addClass('mpimage')
			$('#num-votes-row').hide()
		else
			$('#mpimage1').removeClass('mpimage')
			$('#mpimage2').removeClass('mpimage')
			$('#num-votes-row').show()

	# Provide html to inject into the _fullmatchup partial on the home page
	getFullMatchupHTML = (data) ->
		fullMatchupHtml = 
		'<div class="row">' +
			'<div id="matchupID" data-matchupid=' + data.matchup.id + '></div>' +
			'<div id="mpcontainer" class="">' +
				'<div id="mp1" class="span5 mp">' +
					'<h3>' + data.player1.first_name + ' ' + data.player1.last_name + '</h3>' +
					'<h4>' + data.player1OpponentTeamName + '</h4>' +
					'<div id="mpimage1" class="mpimage">' +
						'<img src="/images/' + data.player1.first_name + '_' + data.player1.last_name + '.jpg" alt="' + data.player1.first_name + '_' + data.player1.last_name + '" class= "playerpic" >' +
					'</div>' +
				'</div>' +
				'<div id="mp2" class="span5 mp">' +
					'<h3>' + data.player2.first_name + ' ' + data.player2.last_name + '</h3>' +
					'<h4>' + data.player2OpponentTeamName + '</h4>' +
					'<div id="mpimage2" class="mpimage">' +
						'<img src="/images/' + data.player2.first_name + '_' + data.player2.last_name + '.jpg" alt="' + data.player2.first_name + '_' + data.player2.last_name + '" class= "playerpic" >' +
						# '<%= image_tag("' + data.player2.first_name + '_' + data.player2.last_name + '.jpg", alt: "' + data.player2.first_name + '_' + data.player2.last_name + '", class: "playerpic") %>' +
					'</div>' +
				'</div>' +
			'</div>' +
		'</div>' +
		'</br>' +
		'<div class="row" id="num-votes-row" class="hiddenVoteRow">' +
			'<div class="">' +
				'<div id="mpts1" class="span5">' +
					'<h2>' + data.ptsplayer1 + '</h2>' +
				'</div>' +
				'<div id="mpts2" class="span5">' +
					'<h2>' + data.ptsplayer2 + '</h2>' +
				'</div>' +
			'</div>' +
		'</div>'


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

		    # console.log(data)	
		    # console.log(getFullMatchupHTML(data))

		    $('#num-votes-row').slideDown(500)
		    delay = (ms, func) -> setTimeout func, ms
		    delay 1500, ->
		    	$('#matchupcontainer').fadeOut()
			    delay 700, ->
			    	$('#matchupcontainer').html(getFullMatchupHTML(data))
					  delay 1000, ->
				    	$('#matchupcontainer').fadeIn()
					    delay 1000, ->
					    	addClickListenersToPlayerPictures()
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

	addClickListenersToPlayerPictures()

	# if $('#home-h1').text() == 'Who Would You Start?'
	# 	$('#num-votes-row').hide()
	# else
	# 	$('#num-votes-row').show()

