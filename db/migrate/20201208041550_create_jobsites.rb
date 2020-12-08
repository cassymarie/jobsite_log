class CreateJobsites < ActiveRecord::Migration
  def change
    create_table :jobsites do |t|
      t.string :name
    end
  end
end
