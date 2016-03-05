class InitialTest < ActiveRecord::Base
  ##
  # Associations
  #
  belongs_to :user
  has_many :exercise_details, through: :workouts
  has_many :workouts

  ##
  # Validations
  #

  ##
  # Callbacks
  #
  after_create :create_initial_workouts
  after_save :check_if_complete

  has_paper_trail

private

  def create_initial_workouts
    first_workout = workouts.create(user_id: user_id)
    build_first_workout_exercises(first_workout)
#    second_workout = workouts.create(user_id: user_id)
#    build_second_workout_exercises(second_workout)
  end

  def check_if_complete
    binding.pry
    return unless workouts.all? { |workout| !!workout.mark_complete_if_so! }
    binding.pry
    ::WorkoutGeneration::WorkoutGenerator.generate_workouts(self)
  end

  def build_first_workout_exercises(workout)
      pushups = Exercise.where(name: "pushups", youtube_url: "https://www.youtube.com/watch?v=zF0jbubK_jU", proper_form_text: "up and down").first_or_create
      mile_run = Exercise.where(name: "one mile run", youtube_url: "https://www.youtube.com/watch?v=wRkeBVMQSgg", proper_form_text: "run fast").first_or_create
      body_weight_squats = Exercise.where(name: "body weight squats", youtube_url: "https://www.youtube.com/watch?v=p3g4wAsu0R4", proper_form_text: "up and down, actually").first_or_create
      situps = Exercise.where(name: "situps", youtube_url: "https://www.youtube.com/watch?v=jDwoBqPH0jk", proper_form_text: "up and down, again").first_or_create
      if pushups.muscle_groups.blank?
        pushups.muscle_groups.create([
          {:name => "Pectoralis", :weighted_score => 75},
          {:name => "Biceps", :weighted_score => 10},
          {:name => "Triceps", :weighted_score => 10},
          {:name => "Abdominal", :weighted_score => 5}
        ])
      end

      if mile_run.muscle_groups.blank?
        mile_run.muscle_groups.create([
          {:name => "Quadriceps", :weighted_score => 55},
          {:name => "Hamstrings", :weighted_score => 35},
          {:name => "Glutes", :weighted_score => 10}
        ])
      end

      if body_weight_squats.muscle_groups.blank?
        body_weight_squats.muscle_groups.create([
          {:name => "Quadriceps", :weighted_score => 55},
          {:name => "Hamstrings", :weighted_score => 35},
          {:name => "Glutes", :weighted_score => 10}
        ])
      end

      if situps.muscle_groups.blank?
        situps.muscle_groups.create([
          {:name => "Abdominal", :weighted_score => 100}
        ])
      end
    workout.exercise_details.create([
      {exercise: pushups},
      {exercise: mile_run},
      {exercise: body_weight_squats},
      {exercise: situps}
    ])
  end
end
