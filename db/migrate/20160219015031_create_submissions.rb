class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :challenge, index: true, foreign_key: true
      t.text :code
      t.decimal :time
      t.integer :length

      t.timestamps null: false
    end
  end
end
