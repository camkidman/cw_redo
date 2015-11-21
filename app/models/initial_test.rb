class InitialTest < ActiveRecord::Base
  belongs_to :user
  has_many :exercise_details
  has_many :exercises, through: :exercise_details
  has_one :workout

  has_paper_trail
end
