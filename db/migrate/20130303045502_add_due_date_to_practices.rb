class AddDueDateToPractices < ActiveRecord::Migration
  def change
    add_column :practices, :due_date, :datetime
  end
end
