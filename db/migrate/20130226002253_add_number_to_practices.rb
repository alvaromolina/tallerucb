class AddNumberToPractices < ActiveRecord::Migration
  def change
    add_column :practices, :number, :integer
  end
end