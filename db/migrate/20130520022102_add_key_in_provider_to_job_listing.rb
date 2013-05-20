class AddKeyInProviderToJobListing < ActiveRecord::Migration
  def change
    add_column :job_listings, :key_in_provider, :string
  end
end
