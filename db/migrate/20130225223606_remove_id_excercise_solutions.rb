class RemoveIdExcerciseSolutions < ActiveRecord::Migration
  def up
    remove_column :solutions, :id_exercise

  end

  def down
    add_column :solutions, :id_exercise, :integer

  end
end
