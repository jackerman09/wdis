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
		  error: (xhr,status,error) ->
		    console.log(xhr)
		    alert(error)
		  })

	$('#mp1').click pointForPlayer1
	$('#mp2').click pointForPlayer1

