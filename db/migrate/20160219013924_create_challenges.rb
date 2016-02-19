class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.text :title
      t.text :descripton

      t.timestamps null: false
    end
  end
end
