class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :code, :limit => 3
      t.string :name
    end
  end
end
