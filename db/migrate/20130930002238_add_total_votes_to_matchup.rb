class AddTotalVotesToMatchup < ActiveRecord::Migration
  def change
    add_column :matchups, :total_votes, :integer
  end
end
