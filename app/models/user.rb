class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_one :initial_test
  has_many :workouts
  has_many :exercises, through: :workouts
  has_many :exercise_details, through: :exercises
  has_many :goals
  has_one :schedule
  has_many :personal_details

  has_attached_file :progress_picture,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                     styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"

  after_create :create_initial_test
  after_create :create_initial_goals
  after_create :create_schedule

  validates_attachment_content_type :progress_picture, content_type: /\Aimage\/.*\Z/

  def s3_credentials
    {:bucket => "cw-bucket", :access_key_id => APP_CONFIG['amazon_access_key_id'], :secret_access_key => APP_CONFIG['amazon_secret_access_key']}
  end

private

  def create_initial_goals
    goals.create(::Goal::DEFAULT_GOAL_HASH)
  end
end
