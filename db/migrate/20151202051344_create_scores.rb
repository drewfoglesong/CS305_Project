class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :entry
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
	add_index :scores, [:student_id, :created_at]
  end
end
