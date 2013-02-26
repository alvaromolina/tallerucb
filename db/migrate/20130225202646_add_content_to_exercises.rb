class AddContentToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :content, :text
  end
end
