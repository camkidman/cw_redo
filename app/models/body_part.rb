class BodyPart < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :muscle_group
end
