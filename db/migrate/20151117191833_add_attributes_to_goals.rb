class AddAttributesToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :text, :string
  end
end
