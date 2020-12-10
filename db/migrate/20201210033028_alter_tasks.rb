class AlterTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :jobsite_id, :integer
  end
end
