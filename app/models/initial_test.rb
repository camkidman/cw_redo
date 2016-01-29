class InitialTest < ActiveRecord::Base
  ##
  # Associations
  #
  belongs_to :user
  has_many :exercises, through: :workouts
  has_many :workouts

  ##
  # Validations
  #

  ##
  # Callbacks
  #
  after_create :create_initial_workouts
#  after_save :check_if_complete

  has_paper_trail

private

  def create_initial_workouts
    first_workout = workouts.create(user_id: user_id)
    build_first_workout_exercises(first_workout)
#    second_workout = workouts.create(user_id: user_id)
#    build_second_workout_exercises(second_workout)
  end

#  def check_if_complete
#    if initial_test.
#  end

  def build_first_workout_exercises(workout)
    workout.exercises.create([
      { name: "pushups", youtube_url: "https://www.youtube.com", proper_form_text: "up and down" },
      { name: "one_mile_run", youtube_url: "https://www.youtube.com", proper_form_text: "run fast" },
      { name: "body_weight_squats", youtube_url: "https://www.youtube.com", proper_form_text: "up and down, actually" },
      { name: "situps", youtube_url: "https://www.youtube.com", proper_form_text: "up and down, again" }
    ])
  end
end
