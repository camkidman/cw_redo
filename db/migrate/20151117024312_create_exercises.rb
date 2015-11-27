class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :youtube_url
      t.string :proper_form_text
      t.boolean :cardio
      t.boolean :requires_gym
      t.references :workout, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
