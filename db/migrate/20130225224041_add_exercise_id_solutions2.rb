class AddExerciseIdSolutions2 < ActiveRecord::Migration
  def up
    add_column :solutions, :exercise_id, :integer

  end
  
  def down
    remove_column :solutions, :exercise_id

  end
end
