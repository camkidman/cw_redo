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
        new_exercise_detail_array = []

        workout.exercise_details.each do |exercise_detail|
          new_exercises = exercise_detail.exercise.similar_exercises.compact.sample(5).uniq
          new_exercise_detail_array << new_exercises.map { |new_exercise| ExerciseDetail.new(reps: (exercise_detail.reps * 0.2).ceil.to_i, sets: exercise_detail.sets, exercise: new_exercise) }
        end

        mixed_exercise_details = :zip.to_proc[*new_exercise_detail_array]
        mixed_exercise_details.each do |mixed_exercise_detail_array|
          mixed_exercise_detail_array.compact!
          Workout.create(user_id: user.id, exercise_details: mixed_exercise_detail_array)
        end
      end
    end
  end
end
