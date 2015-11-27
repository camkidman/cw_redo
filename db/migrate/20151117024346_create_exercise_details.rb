class CreateExerciseDetails < ActiveRecord::Migration
  def change
    create_table :exercise_details do |t|
      t.references :user, index: true, foreign_key: true
      t.references :initial_test, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
