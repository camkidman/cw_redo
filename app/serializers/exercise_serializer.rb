class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :youtube_url, :proper_form_text, :cardio, :requires_gym
end
