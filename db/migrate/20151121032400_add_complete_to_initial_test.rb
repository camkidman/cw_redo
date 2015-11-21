class AddCompleteToInitialTest < ActiveRecord::Migration
  def change
    add_column :initial_tests, :complete, :boolean
  end
end
