# == Schema Information
#
# Table name: players
#
#  id          :integer          not null, primary key
#  last_name   :string(255)
#  first_name  :string(255)
#  position    :string(255)
#  pts_week_1  :decimal(, )
#  pts_week_2  :decimal(, )
#  pts_week_3  :decimal(, )
#  pts_week_4  :decimal(, )
#  pts_week_5  :decimal(, )
#  pts_week_6  :decimal(, )
#  pts_week_7  :decimal(, )
#  pts_week_8  :decimal(, )
#  pts_week_9  :decimal(, )
#  pts_week_10 :decimal(, )
#  pts_week_11 :decimal(, )
#  pts_week_12 :decimal(, )
#  pts_week_13 :decimal(, )
#  pts_week_14 :decimal(, )
#  pts_week_15 :decimal(, )
#  pts_week_16 :decimal(, )
#  pts_week_17 :decimal(, )
#  created_at  :datetime
#  updated_at  :datetime
#  team_id     :integer
#




class Player < ActiveRecord::Base
	validates :last_name, presence: true
	validates :first_name, presence: true
	validates :team, presence: true

	before_create :set_pts_to_0
	before_save { self.full_name = "#{first_name} #{last_name}" }

	belongs_to :team
	has_many :matchplays
	has_many :matchups, through: :matchplays

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
