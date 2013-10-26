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
$('#players-table').empty()
$('#players-table').html(newtable)
$('#players-table').tablesorter({sortList: [[1,1], [0,0]]})