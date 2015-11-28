class AddWeightedScoreToMuscleGroup < ActiveRecord::Migration
  def change
    add_column :muscle_groups, :weighted_score, :integer
  end
end
