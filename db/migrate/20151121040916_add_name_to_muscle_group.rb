class AddNameToMuscleGroup < ActiveRecord::Migration
  def change
    add_column :muscle_groups, :name, :string
  end
end
