class AddPassedToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :passed, :bool
  end
end
