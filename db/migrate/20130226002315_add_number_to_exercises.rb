class AddNumberToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :number, :integer
  end
end
