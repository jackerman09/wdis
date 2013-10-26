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
	loadinghtml = 
		'<div id="loading-div">' +
		'<h2>LOADING PLAYER SCORES...</h2>' +
		'<div id="floatingCirclesG">' +
		'<div class="f_circleG" id="frotateG_01">' +
		'</div>' +
		'<div class="f_circleG" id="frotateG_02">' +
		'</div>' +
		'<div class="f_circleG" id="frotateG_03">' +
		'</div>' +
		'<div class="f_circleG" id="frotateG_04">' +
		'</div>' +
		'<div class="f_circleG" id="frotateG_05">' +
		'</div>' +
		'<div class="f_circleG" id="frotateG_06">' +
		'</div>' +
		'<div class="f_circleG" id="frotateG_07">' +
		'</div>' +
		'<div class="f_circleG" id="frotateG_08">' +
		'</div>' +
		'</div>' +
		'</div>'
	$('#show-scores-button').bind('ajax:beforeSend', ->
		$('#players-table').html(loadinghtml)
	)
