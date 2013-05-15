class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :role
      t.string :location

      t.timestamps
    end
  end
end
