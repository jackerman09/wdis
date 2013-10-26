console.log('in showscores.js')
newtable = 
	'<thead>' +
	'<tr>' +
	'<th>Player</th>' +
	"<th>This Week's Score</th>" +
	'</tr>' +
	'</thead>' +
	'<% @players.each do |player| %>' +
	'<tr>' +
  '<td><%= link_to "#{player.last_name}, #{player.first_name}", player %></td>' +
	'<td><%= player.scored_vote(current_week) %></td>' +
	'</tr>'+
	'<% end %>'
$('#players-table').html('')
$('#players-table').html(newtable)