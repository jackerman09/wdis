# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $('show-scores-link').bind("ajaxSend", function(){
#    # $("#loading").show();
#    console.log('before-send ran')
#  }).bind("ajaxComplete", function(){
#    # $("#loading").hide();
#    console.log('complete ran')
#  });

jQuery ->
	$('#show-scores-button').bind('ajax:beforeSend', ->
	  $('#players-table').html('<h2>LOADING...</h2>')
	)
	# $('#show-scores-button').bind('ajax:complete', ->
	#   console.log 'complete ran'
	# )