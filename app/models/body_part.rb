class BodyPart < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :muscle_group

  BODY_PART_NAMES = %w(Back Arms Legs Ankles Wrists Neck Shoulders)
end
