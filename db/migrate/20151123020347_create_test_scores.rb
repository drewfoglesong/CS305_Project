class CreateTestScores < ActiveRecord::Migration
  def change
    create_table :test_scores do |t|
      t.integer :chapter4

      t.timestamps null: false
    end
  end
end
