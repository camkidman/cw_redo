desc "Import exercises"
task :import_exercises do
  csv = SmarterCSV.process(Rails.root + "lib/files/workouts.csv", :row_sep => "\r")
  csv.each do |exercise|
    ex = Exercise.create(name: exercise[:name], youtube_url: exercise[:youtube_url], proper_form_text: exercise[:proper_form_text], cardio: exercise[:is_run] == "no" ? false : true, requires_gym: exercise[:requires_gym] == "no" ? false : true)
    exercise_reference = ExerciseReference.create(name: exercise[:name].upcase)
    muscle_attributes = exercise.select {|key, value| key.to_s.match(/^muscle_group/) || key.to_s.match(/^weighted_score/) }
    for i in 1..3 do
      MuscleGroup.create(:name => muscle_attributes["muscle_group_#{i}".to_sym], :weighted_score => muscle_attributes["weighted_score_#{i}".to_sym], :exercise_id => ex.id)
      MuscleGroup.create(:name => muscle_attributes["muscle_group_#{i}".to_sym], :weighted_score => muscle_attributes["weighted_score_#{i}".to_sym], :exercise_reference_id => exercise_reference.id)
    end
    # that'll do for v0
  end
end
