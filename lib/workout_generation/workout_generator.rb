module WorkoutGeneration
  class WorkoutGenerator
    attr_accessor :test_workouts, :user, :test_exercises, :test_exercise_details
    def initialize(initial_test)
      @test_workouts = initial_test.workouts
      @user = initial_test.user

    end

    def self.generate_workouts(initial_test)
      self.new(initial_test).generate_workouts
    end

    def generate_workouts
      workouts = test_workouts
      new_workout_set = workouts.map do |workout|
        workout.exercises.map(&:similar_exercises).map { |similar_exercise_array| similar_exercise_array.compact.sample }.uniq
      end
      new_workout_set.each { |exercise_array| user.workouts.create(exercises: exercise_array) }
    end
  end
end
