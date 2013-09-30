# == Schema Information
#
# Table name: matchups
#
#  id                   :integer          not null, primary key
#  player_1             :integer
#  player_2             :integer
#  pts_player_1_week_1  :integer
#  pts_player_1_week_2  :integer
#  pts_player_1_week_3  :integer
#  pts_player_1_week_4  :integer
#  pts_player_1_week_5  :integer
#  pts_player_1_week_6  :integer
#  pts_player_1_week_7  :integer
#  pts_player_1_week_8  :integer
#  pts_player_1_week_9  :integer
#  pts_player_1_week_10 :integer
#  pts_player_1_week_11 :integer
#  pts_player_1_week_12 :integer
#  pts_player_1_week_13 :integer
#  pts_player_1_week_14 :integer
#  pts_player_1_week_15 :integer
#  pts_player_1_week_16 :integer
#  pts_player_1_week_17 :integer
#  pts_player_2_week_1  :integer
#  pts_player_2_week_2  :integer
#  pts_player_2_week_3  :integer
#  pts_player_2_week_4  :integer
#  pts_player_2_week_5  :integer
#  pts_player_2_week_6  :integer
#  pts_player_2_week_7  :integer
#  pts_player_2_week_8  :integer
#  pts_player_2_week_9  :integer
#  pts_player_2_week_10 :integer
#  pts_player_2_week_11 :integer
#  pts_player_2_week_12 :integer
#  pts_player_2_week_13 :integer
#  pts_player_2_week_14 :integer
#  pts_player_2_week_15 :integer
#  pts_player_2_week_16 :integer
#  pts_player_2_week_17 :integer
#  created_at           :datetime
#  updated_at           :datetime
#



class Matchup < ActiveRecord::Base
	validates :player_1, presence: true
	validates :player_2, presence: true

	before_create		:set_matchup_pts_to_0
	before_save			:update_total_votes

	has_many :matchplays
	has_many :players, through: :matchplays

	def current_week
		1
	end

	private
		def set_matchup_pts_to_0
			self.pts_player_1_week_1  = 0
			self.pts_player_1_week_2  = 0
			self.pts_player_1_week_3  = 0
			self.pts_player_1_week_4  = 0
			self.pts_player_1_week_5  = 0
			self.pts_player_1_week_6  = 0
			self.pts_player_1_week_7  = 0
			self.pts_player_1_week_8  = 0
			self.pts_player_1_week_9  = 0
			self.pts_player_1_week_10 = 0
			self.pts_player_1_week_11 = 0
			self.pts_player_1_week_12 = 0
			self.pts_player_1_week_13 = 0
			self.pts_player_1_week_14 = 0
			self.pts_player_1_week_15 = 0
			self.pts_player_1_week_16 = 0
			self.pts_player_1_week_17 = 0
			self.pts_player_2_week_1  = 0
			self.pts_player_2_week_2  = 0
			self.pts_player_2_week_3  = 0
			self.pts_player_2_week_4  = 0
			self.pts_player_2_week_5  = 0
			self.pts_player_2_week_6  = 0
			self.pts_player_2_week_7  = 0
			self.pts_player_2_week_8  = 0
			self.pts_player_2_week_9  = 0
			self.pts_player_2_week_10 = 0
			self.pts_player_2_week_11 = 0
			self.pts_player_2_week_12 = 0
			self.pts_player_2_week_13 = 0
			self.pts_player_2_week_14 = 0
			self.pts_player_2_week_15 = 0
			self.pts_player_2_week_16 = 0
			self.pts_player_2_week_17 = 0
			self.total_votes = 0
		end

		def update_total_votes
			current_week = self.current_week
			self.total_votes = send("pts_player_1_week_#{current_week}") + send("pts_player_2_week_#{current_week}")
		end
end
