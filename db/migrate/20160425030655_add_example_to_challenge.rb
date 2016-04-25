class AddExampleToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :example, :text
  end
end
