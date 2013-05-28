class CreateJobListings < ActiveRecord::Migration
  def change
    create_table :job_listings do |t|
      t.string :title
      t.integer :provider_id
      t.text :description
      t.text :extra
      t.string :location_string
      t.text :url
      t.integer :job_id

      t.timestamps
    end
  end
end
