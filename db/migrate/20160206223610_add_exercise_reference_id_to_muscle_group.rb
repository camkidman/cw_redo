class AddExerciseReferenceIdToMuscleGroup < ActiveRecord::Migration
  def change
    add_reference :muscle_groups, :exercise_reference, index: true, foreign_key: true
  end
end
