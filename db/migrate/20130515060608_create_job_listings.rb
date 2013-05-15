class CreateJobListings < ActiveRecord::Migration
  def change
    create_table :job_listings do |t|
      t.string :title
      t.integer :id
      t.integer :provider_id
      t.string :description
      t.string :extra
      t.string :location_string
      t.string :url
      t.integer :job_id

      t.timestamps
    end
  end
end
