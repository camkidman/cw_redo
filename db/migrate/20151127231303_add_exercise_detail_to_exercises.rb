class AddExerciseDetailToExercises < ActiveRecord::Migration
  def change
    add_reference :exercises, :exercise_detail, index: true, foreign_key: true
  end
end
