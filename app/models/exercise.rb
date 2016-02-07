class Exercise < ActiveRecord::Base
  has_many :muscle_groups
  has_many :body_parts, through: :muscle_groups
  belongs_to :workout
  belongs_to :exercise_detail

  accepts_nested_attributes_for :exercise_detail
  before_create :create_exercise_detail
  before_create :check_for_exercise_reference

  def primary_muscle_group
    muscle_groups.max_by { |muscle_group| muscle_group.weighted_score.to_f }
  end

  def similar_exercises
    MuscleGroup.where(name: primary_muscle_group.name).where(weighted_score: weighted_score_difference).map(&:exercise)
  end

  private

  def check_for_exercise_reference
    if exercise_reference = ExerciseReference.where(:name => name.upcase).first
      self.muscle_groups = exercise_reference.muscle_groups
    end
  end

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
