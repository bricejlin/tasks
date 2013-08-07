class RenameTaskColumnToDescription < ActiveRecord::Migration
  def change
  	rename_column :tasks, :task, :description
  end
end
