class CreateInitialTests < ActiveRecord::Migration
  def change
    create_table :initial_tests do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end