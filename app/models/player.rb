




class Player < ActiveRecord::Base
	validates :last_name, presence: true
	validates :first_name, presence: true
	validates :team, presence: true

	before_create :set_pts_to_0
	before_save { self.image_name = "#{first_name}_#{last_name}.jpg" }
	before_save { self.full_name = "#{first_name} #{last_name}" }

	belongs_to :team
	has_many :matchplays
	has_many :matchups, through: :matchplays

	def win_pct(current_week)
		# The number of times player 1 has appeared in a matchup (as either player 1 or player 2)
		this_week_appearances = self.num_matchups(current_week)    

    # The number of times player 1 has appeared in a matchup (as either player 1 or player 2) and won
    this_week_wins = Matchup.where(player_1: self.id).sum("pts_player_1_week_#{current_week}")
    this_week_wins += Matchup.where(player_2: self.id).sum("pts_player_2_week_#{current_week}")

    # The percentage of times that player 1 has won a matchup that he was in
    if this_week_appearances > 0 then
    	# Use max so that even if a player has never won a matchup, their opponent gets a little credit for beating them
    	this_week_win_pct = [this_week_wins.to_f/this_week_appearances.to_f, 0.1].max
    else
    	this_week_win_pct = 0.5
    end
    this_week_win_pct
	end

	def scored_vote(current_week)
		total_weighted_score = 0
		Matchup.where('player_1=? OR player_2=?', self.id, self.id).each do |m|
			if m.player_1 == self.id
				total_weighted_score += m.send("pts_player_1_week_#{current_week}").to_f*Player.find(m.player_2).win_pct(current_week)
			else
				total_weighted_score += m.send("pts_player_2_week_#{current_week}").to_f*Player.find(m.player_1).win_pct(current_week)
			end
		end
		logger.debug("weighted_score: #{total_weighted_score}")
		if self.num_matchups(current_week) > 0
			total_weighted_score_per_matchup = total_weighted_score.to_f/self.num_matchups(current_week).to_f
		else
			total_weighted_score_per_matchup = 0.0
		end
		total_weighted_score_per_matchup = (total_weighted_score_per_matchup*100).round(2)
	end

	def num_matchups(current_week)
		this_week_appearances = 0
		# this_week_appearances += Matchup.where(player_1: self.id).sum("pts_player_1_week_#{current_week}")
  #   this_week_appearances += Matchup.where(player_1: self.id).sum("pts_player_2_week_#{current_week}")
  #   this_week_appearances += Matchup.where(player_2: self.id).sum("pts_player_1_week_#{current_week}")
  #   this_week_appearances += Matchup.where(player_2: self.id).sum("pts_player_2_week_#{current_week}")
  	this_week_appearances =	Matchup.where('player_1 = :id or player_2 = :id', :id => self.id).sum("pts_player_1_week_#{current_week} + pts_player_2_week_#{current_week}").to_i
	end
	private
		def set_pts_to_0
			self.pts_week_1  = 0
			self.pts_week_2  = 0
			self.pts_week_3  = 0
			self.pts_week_4  = 0
			self.pts_week_5  = 0
			self.pts_week_6  = 0
			self.pts_week_7  = 0
			self.pts_week_8  = 0
			self.pts_week_9  = 0
			self.pts_week_10 = 0
			self.pts_week_11 = 0
			self.pts_week_12 = 0
			self.pts_week_13 = 0
			self.pts_week_14 = 0
			self.pts_week_15 = 0
			self.pts_week_16 = 0
			self.pts_week_17 = 0
		end
end
