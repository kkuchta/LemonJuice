class JobListing < ActiveRecord::Base

  def self.ingest_job_listing( job_listing_data )
      # If we have a pre-existing job listing from this provider
      #   skip it
      #JobListing.where( provider_id

      # else, look for an existing job listing from another provider
      #   if found, add this listing to that listing's job object

      # else, create new job and job listing
  end
end
