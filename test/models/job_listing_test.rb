require 'test_helper'
class JobListingTest < ActiveSupport::TestCase
  test "ingest existing listing" do
    assert_no_difference('JobListing.count', 'Added a listing when we shouldnt have') do
      JobListing.ingest_job_listing({
        key_in_provider: 123,
        provider_id: 1
      });
    end
  end

  test "ingest new listing, old job" do

    # We have a pre-existing similar listing, but for provider 1
    assert_not_nil( JobListing.where( {
      title: "Cobol Ninja",
      provider_id: 1,
      job_id: 1
    } ).first )

    # We have an existing job
    assert_not_nil( Job.where( {
      company: "Megasoft",
      id: 1
    } ).first )

    # Do ingestion, and ensure we don't create a new job here
    assert_no_difference('Job.count') do
      JobListing.ingest_job_listing({
        key_in_provider: 789,
        provider_id: 2,
        title: "Cobol Ninja",
        company: "Megasoft"
      })
    end

    # ensure we *do* create a new job listing for provider 2
    assert_not_nil( JobListing.where({
      title: "Cobol Ninja",
      provider_id: 2,
      job_id: 1
    }) )
  end

  test "ingest new listing, new job" do
    # TODO
    assert( false )
  end
end
