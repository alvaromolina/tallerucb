class AddExerciseIdSolutions < ActiveRecord::Migration

  def up
    add_column :solutions, :id_exercise, :integer

  end
  
  def down
    remove_column :solutions, :id_exercise

  end


end
