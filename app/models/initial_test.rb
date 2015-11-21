class InitialTest < ActiveRecord::Base
  ##
  # Associations
  #
  belongs_to :user
  has_many :exercise_details
  has_many :exercises, through: :workout
  has_one :workout

  ##
  # Validations
  #

  ##
  # Callbacks
  #
  after_create :create_initial_workout

  has_paper_trail

private

  def create_initial_workout
    workout = create_workout
    build_initial_exercises(workout)
  end

  def build_initial_exercises(workout)
    workout.exercises.create([
      { name: "pushups", youtube_url: "https://www.youtube.com", proper_form_text: "up and down" },
      { name: "one_mile_run", youtube_url: "https://www.youtube.com", proper_form_text: "run fast" },
      { name: "body_weight_squats", youtube_url: "https://www.youtube.com", proper_form_text: "up and down, actually" },
      { name: "situps", youtube_url: "https://www.youtube.com", proper_form_text: "up and down, again" }]) #this makes me feel like a javascript dev
  end
end
