class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :role
      t.string :location
      t.integer :id

      t.timestamps
    end
  end
end
