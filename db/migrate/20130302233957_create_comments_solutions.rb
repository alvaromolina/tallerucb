class CreateCommentsSolutions < ActiveRecord::Migration
  def change
    create_table :comments_solutions do |t|
      t.integer :solution_id
      t.text :comment

      t.timestamps
    end
  end
end
