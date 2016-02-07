class AddCompleteToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :complete, :boolean
  end
end
