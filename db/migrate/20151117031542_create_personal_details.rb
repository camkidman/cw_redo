class CreatePersonalDetails < ActiveRecord::Migration
  def change
    create_table :personal_details do |t|
      t.string :gender
      t.integer :weight
      t.integer :neck
      t.integer :shoulders
      t.integer :chest
      t.integer :bicep
      t.integer :waist
      t.integer :hips
      t.integer :thigh
      t.integer :resting_heart_rate
      t.integer :calf
      t.references :user, index: true, foreign_key: true
      t.date :date

      t.timestamps null: false
    end
  end
end
