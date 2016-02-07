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
    return if workouts.collect(&:exercise_details).first.any? { |ed| ed.attributes.any? {|attr, value| value.nil?} } #todo feb6th, need to clean up initial_test_id, I think
    ::WorkoutGenerator.generate_workouts(self)
  end

  def build_first_workout_exercises(workout)
    workout.exercises.create([
      { name: "pushups", youtube_url: "https://www.youtube.com/watch?v=zF0jbubK_jU", proper_form_text: "up and down" },
      { name: "one mile run", youtube_url: "https://www.youtube.com/watch?v=wRkeBVMQSgg", proper_form_text: "run fast" },
      { name: "body weight squats", youtube_url: "https://www.youtube.com/watch?v=p3g4wAsu0R4", proper_form_text: "up and down, actually" },
      { name: "situps", youtube_url: "https://www.youtube.com/watch?v=jDwoBqPH0jk", proper_form_text: "up and down, again" }
    ])
  end
end
