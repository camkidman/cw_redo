class CreateBodyParts < ActiveRecord::Migration
  def change
    create_table :body_parts do |t|
      t.references :exercise, index: true, foreign_key: true
      t.references :muscle_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
