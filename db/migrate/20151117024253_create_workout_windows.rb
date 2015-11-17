class CreateWorkoutWindows < ActiveRecord::Migration
  def change
    create_table :workout_windows do |t|
      t.references :schedule, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
