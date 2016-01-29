class PersonalDetailSerializer < ActiveModel::Serializer
  attributes :id, :gender, :weight, :neck, :calf, :thigh, :shoulders, :chest, :bicep, :waist, :hips, :resting_heart_rate, :date, :user_id
end
