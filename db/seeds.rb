# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
["pushups", "situps", "body_weight_squats", "one_mile_run"].each {|s| Exercise.find_or_create_by(name: s) }
puts "Created initial 3 exercises"

["Abdominal", "Biceps", "Deltoids", "Erector Spinae", "Gastrocnemius and Soleus", "Gluteus", "Hamstrings", "Latissimus Dorsi", "Rhomboids", "Obliques", "Pectoralis", "Quadriceps", "Trapezius", "Triceps"].each do |mg|
  MuscleGroup.find_or_create_by(name: mg)
end

puts "Created default muscle groups"

["Get stronger", "Get faster", "Slim down", "Lose baby weight", "Bulk Up", "Tone up", "Get started"].each do |g|
  Goal.find_or_create_by(text: g)
end

