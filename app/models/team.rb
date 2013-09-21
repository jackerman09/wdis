# == Schema Information
#
# Table name: teams
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  location     :string(255)
#  opp_week_1   :integer
#  opp_week_2   :integer
#  opp_week_3   :integer
#  opp_week_4   :integer
#  opp_week_5   :integer
#  opp_week_6   :integer
#  opp_week_7   :integer
#  opp_week_8   :integer
#  opp_week_9   :integer
#  opp_week_10  :integer
#  opp_week_11  :integer
#  opp_week_12  :integer
#  opp_week_13  :integer
#  opp_week_14  :integer
#  opp_week_15  :integer
#  opp_week_16  :integer
#  opp_week_17  :integer
#  home_week_1  :boolean
#  home_week_2  :boolean
#  home_week_3  :boolean
#  home_week_4  :boolean
#  home_week_5  :boolean
#  home_week_6  :boolean
#  home_week_7  :boolean
#  home_week_8  :boolean
#  home_week_9  :boolean
#  home_week_10 :boolean
#  home_week_11 :boolean
#  home_week_12 :boolean
#  home_week_13 :boolean
#  home_week_14 :boolean
#  home_week_15 :boolean
#  home_week_16 :boolean
#  home_week_17 :boolean
#  created_at   :datetime
#  updated_at   :datetime
#



class Team < ActiveRecord::Base
	validates :name, presence: true

	belongs_to :player
end
