class JobListing < ActiveRecord::Base

  belongs_to :job

  def self.ingest_job_listing( job_listing_data )

      # If we have a pre-existing job listing from this provider, skip it
      if( JobListing.exists?( {
        key_in_provider: job_listing_data[:key_in_provider],
        provider_id: job_listing_data[:provider_id]
      } ) )
        return
        # skip
      end
      #logger.info( "here 2" )

      # else, look for an existing job listing from another provider
      #   if found, add this listing to that listing's job object
      # For now, just look for an exact company name and job title match
      same_job_different_provider = JobListing.joins(:job).where( {
        title: job_listing_data[:title],
        jobs: { company: job_listing_data[:company] }
      } ).first;

      if same_job_different_provider
        job = same_job_different_provider.job
        new = JobListing.create({
          title: job_listing_data[:title],
          provider_id: job_listing_data[:provider_id],
          description: job_listing_data[:description],
          extra: job_listing_data[:extra],
          location_string: job_listing_data[:location_string],
          url: job_listing_data[:url],
          provider_updated_at: job_listing_data[:provider_updated_at],
          key_in_provider: job_listing_data[:key_in_provider],
        })
        job.job_listings << new
        return
      end

      # else, create new job and job listing
      Job.create({
        role: job_listing_data[:role],
        location: job_listing_data[:location_string],
        company: job_listing_data[:company]
      }).job_listings << JobListing.create({
        title: job_listing_data[:title],
        provider_id: job_listing_data[:provider_id],
        description: job_listing_data[:description],
        extra: job_listing_data[:extra],
        location_string: job_listing_data[:location_string],
        url: job_listing_data[:url],
        provider_updated_at: job_listing_data[:provider_updated_at],
        key_in_provider: job_listing_data[:key_in_provider],
      })
  end
end
