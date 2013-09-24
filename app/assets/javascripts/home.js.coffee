jQuery ->
	pointForPlayer1 = (e) ->
		e.preventDefault()
		console.log('player 1 clicked')
		# $.post({
		# 	url: '/updatepts',
		# 	data: { newPointValue: $('mpts1').val() , matchupid: $('#matchupID').data('matchupid'), player1or2: 1, current_week: current_week},
		# 	})
		matchupid = $('#matchupID').data('matchupid')
		player1or2 = 1
		current_week = current_week
		console.log('matchupid: ' + matchupid + '; player1or2: ' + player1or2 + '; current_week: ' + current_week)
		my_data = 
			matchupid:		matchupid
			player1or2:		player1or2
			current_week:	current_week
		console.log('my_data: ' + my_data)
		$.ajax({ 
		  url: '/updatepts'
		  type: 'get'
		  data: my_data
		  success: (data,status,xhr) ->
		    console.log(data)
		    alert(data.new_player_1_pts)
		  error: (xhr,status,error) ->
		    console.log(xhr)
		    alert(error)
		  })
	pointForPlayer2 = (e) ->
		e.preventDefault()
		console.log('player 2 clicked')

	$('#mp1').click pointForPlayer1
	$('#mp2').click pointForPlayer2

