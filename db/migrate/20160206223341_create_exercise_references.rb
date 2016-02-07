class CreateExerciseReferences < ActiveRecord::Migration
  def change
    create_table :exercise_references do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
