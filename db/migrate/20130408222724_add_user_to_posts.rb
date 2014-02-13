class AddUserToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user, :references
  end
end
