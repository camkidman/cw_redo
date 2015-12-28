class AddBooleanAttributesToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :active, :boolean
    add_column :goals, :cardio_based, :boolean
  end
end
