# == Schema Information
#
# Table name: players
#
#  id          :integer          not null, primary key
#  last_name   :string(255)
#  first_name  :string(255)
#  position    :string(255)
#  team        :integer
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
#

class Player < ActiveRecord::Base
end
