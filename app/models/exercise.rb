class Exercise < ActiveRecord::Base
  has_many :muscle_groups
  has_many :body_parts, through: :muscle_groups
  has_many :workouts, through: :exercise_details
  belongs_to :workout
  belongs_to :exercise_details

  accepts_nested_attributes_for :exercise_details

  def primary_muscle_group
    muscle_groups.max_by(&:weighted_score)
  end

  def similar_exercises
    MuscleGroup.where(name: primary_muscle_group.name).where(weighted_score: weighted_score_difference).map(&:exercise)
  end

  private

  def weighted_score_lower_bound
    primary_muscle_group.weighted_score - 15
  end

  def weighted_score_upper_bound
    primary_muscle_group.weighted_score + 15
  end

  def weighted_score_difference
    weighted_score_lower_bound..weighted_score_upper_bound
  end
end
