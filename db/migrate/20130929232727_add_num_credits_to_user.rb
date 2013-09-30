class AddNumCreditsToUser < ActiveRecord::Migration
  def change
    add_column :users, :num_credits, :integer
  end
end
