class MuscleGroup < ActiveRecord::Base

  DEFAULT_GROUPS = ["Abdominal", "Biceps", "Deltoids", "Erector Spinae", "Gastrocnemius and Soleus", "Gluteus", "Hamstrings", "Latissimus Dorsi", "Rhomboids", "Obliques", "Pectoralis", "Quadriceps", "Trapezius", "Triceps"]
  belongs_to :exercise
  belongs_to :exercise_reference
  has_many :body_parts
end
