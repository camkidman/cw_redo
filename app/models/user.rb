class User < ActiveRecord::Base
  has_one :initial_test
  has_many :workouts
  has_many :exercises, through: :exercise_details
  has_many :exercise_details
  has_many :goals
  has_one :schedule
  has_many :personal_details

  has_attached_file :progress_picture,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                     styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :progress_picture, content_type: /\Aimage\/.*\Z/

  def s3_credentials
    {:bucket => "cw-bucket", :access_key_id => APP_CONFIG['amazon_access_key_id'], :secret_access_key => APP_CONFIG['amazon_secret_access_key']}
  end
end
