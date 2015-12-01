desc "Import exercises"
task :import_exercises do
  csv = SmarterCSV.process(Rails.root + "lib/files/workouts.csv", :row_sep => "\r")
  csv.each do |exercise|
    ex = Exercise.create(name: exercise[:name], youtube_url: exercise[:youtube_url], proper_form_text: exercise[:proper_form_text], cardio: exercise[:is_run] == "no" ? false : true, requires_gym: exercise[:requires_gym] == "no" ? false : true)
    muscle_attributes = exercise.select {|key, value| key.to_s.match(/^muscle_group/) || key.to_s.match(/^weighted_score/) }
    for i in 0..3 do
      MuscleGroup.create(:name => muscle_attributes["muscle_group_#{i}".to_sym], :weighted_score => muscle_attributes["weighted_score_#{i}".to_sym], :exercise_id => ex.id)
    end
#    # still need to modify the keys so they work
#    muscle_attributes.to_a.each_slice(2) { |attribute_and_value_array| 
#      almost_complete_muscle_group_hash = Hash[attribute_and_value_array.map {|key, value| [key, value] }].merge(exercise_id: ex.id)
#      
#    
#    }
  end
end
