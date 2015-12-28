class AddAttributesToWorkoutWindows < ActiveRecord::Migration
  def change
    add_column :workout_windows, :start_time, :datetime
    add_column :workout_windows, :end_time, :datetime
  end
end
