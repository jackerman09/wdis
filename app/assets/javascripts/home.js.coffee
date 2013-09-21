jQuery ->
	pointForPlayer1 = (e) ->
		e.preventDefault()
		console.log('player 1 clicked')
		

	pointForPlayer2 = (e) ->
		e.preventDefault()
		console.log('player 2 clicked')

	$('#mp1').click pointForPlayer1
	$('#mp2').click pointForPlayer2

