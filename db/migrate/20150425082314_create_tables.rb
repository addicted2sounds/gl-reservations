class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :number
      t.text :notes

      t.timestamps null: false
    end
  end
end
