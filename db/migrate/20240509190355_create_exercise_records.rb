class CreateExerciseRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_records do |t|
      t.references :exercise, null: false, foreign_key: true
      t.integer :time
      t.float :speed
      t.integer :calories

      t.timestamps
    end
  end
end
