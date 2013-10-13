




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
