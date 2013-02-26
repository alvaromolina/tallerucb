class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :id_exercise
      t.integer :user_id
      t.float :points
      t.text :result

      t.timestamps
    end
  end
end
