

class Matchup < ActiveRecord::Base
	validates :player_1, presence: true
	validates :player_2, presence: true

	before_create		:set_matchup_pts_to_0
	before_save			:update_total_votes

	has_many :matchplays
	has_many :players, through: :matchplays

	def current_week
  	today = Date.today
    # each variable gives the ending date of the given week
    week1 = "10/9/2013".to_date
    week2 = "17/9/2013".to_date
    week3 = "24/9/2013".to_date
    week4 = "1/10/2013".to_date
    week5 = "8/10/2013".to_date
    week6 = "15/10/2013".to_date
    week7 = "22/10/2013".to_date
    week8 = "29/10/2013".to_date
    week9 = "5/11/2013".to_date
    week10 = "12/11/2013".to_date
    week11 = "19/11/2013".to_date
    week12 = "26/11/2013".to_date
    week13 = "3/12/2013".to_date
    week14 = "10/12/2013".to_date
    week15 = "17/12/2013".to_date
    week16 = "24/12/2013".to_date
    week17 = "31/12/2013".to_date

    # test if today is less than the given week
    # when the current week is found, assign the value to current_week
    if today < week1
      current_week = 1
    elsif today < week2
      current_week = 2
    elsif today < week3
      current_week = 3
    elsif today < week4
      current_week = 4
    elsif today < week5
      current_week = 5
    elsif today < week6
      current_week = 6
    elsif today < week7
      current_week = 7
    elsif today < week8
      current_week = 8
    elsif today < week9
      current_week = 9
    elsif today < week10
      current_week = 10
    elsif today < week11
      current_week = 11
    elsif today < week12
      current_week = 12
    elsif today < week13
      current_week = 13
    elsif today < week14
      current_week = 14
    elsif today < week15
      current_week = 15
    elsif today < week16
      current_week = 16
    elsif today < week17
      current_week = 17
    end
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
			self.total_votes = send("pts_player_1_week_#{current_week}").to_f + send("pts_player_2_week_#{current_week}").to_f
		end
end
