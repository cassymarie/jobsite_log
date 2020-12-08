class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_number
      t.string :name
      t.string :customer
      t.integer :jobsite_id
    end
  end
end
