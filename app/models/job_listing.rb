class JobListing < ActiveRecord::Base

  belongs_to :job

  def self.ingest_job_listing( job_listing_data )

      logger.info( 'data=' + job_listing_data.inspect )
      # If we have a pre-existing job listing from this provider, skip it
      if( JobListing.exists?( {
        key_in_provider: job_listing_data['key_in_provider'],
        provider_id: job_listing_data['provider_id']
      } ) )
        return
        # skip
      end

      # else, look for an existing job listing from another provider
      #   if found, add this listing to that listing's job object
      # For now, just look for an exact company name and job title match
      same_job_different_provider = JobListing.joins(:job).where( {
        title: job_listing_data[:title],
        jobs: { company: job_listing_data[:company] }
      } ).first();

      logger.info "sjdp = " + same_job_different_provider.inspect
      

      # else, create new job and job listing
  end
end
