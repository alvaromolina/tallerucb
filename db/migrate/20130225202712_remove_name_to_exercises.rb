class RemoveNameToExercises < ActiveRecord::Migration
  def up
    remove_column :exercises, :name
  end

  def down
    add_column :exercises, :name, :string
  end
end
