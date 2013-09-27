jQuery ->
	pointForPlayer1 = (e) ->
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
		    
		    $('#credit-counter-value').text(getNumCredits)
		  error: (xhr,status,error) ->
		    console.log(xhr)
		    alert(error)
		  })
	
	if $('#home-header').data('votable') == true
		$('#mp1').click pointForPlayer1
		$('#mp2').click pointForPlayer1

	getNumCredits = ->
		allCookies = document.cookie.split(';')
		for c in allCookies
			if c.substring(0,12) == ' num_credits'
				num_credits_cookie = c
				num_credits_value = num_credits_cookie.substring(num_credits_cookie.indexOf('=') + 1)
				num_credits_number = parseInt(num_credits_value, 10)
		console.log(num_credits_number)
		return num_credits_number

	$('#credit-counter-value').text(getNumCredits)
	console.log(getNumCredits)

