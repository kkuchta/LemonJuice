class AddProviderUpdatedAtToJobListing < ActiveRecord::Migration
  def change
    add_column :job_listings, :provider_updated_at, :datetime
  end
end
