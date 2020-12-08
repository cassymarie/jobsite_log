class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :code, :limit => 3
      t.string :name
    end
  end
end
