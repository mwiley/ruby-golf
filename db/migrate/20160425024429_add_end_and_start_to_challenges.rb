class AddEndAndStartToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :start, :text
    add_column :challenges, :end, :text
  end
end
