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
	# validates :team, presence: true

	belongs_to :team
	has_many :matchplays
	has_many :matchups, through: :matchplays
end
