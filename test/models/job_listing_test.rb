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
    old_listing_count = JobListing.count
    assert_not_nil( JobListing.where( {
      title: "Cobol Ninja",
      job_id: 1
    } ).first )
    assert_not_nil( Job.where( {
      company: "Megasoft",
      id: 1
    } ).first )
    assert_no_difference('Job.count') do
      JobListing.ingest_job_listing({
        key_in_provider: 789,
        provider_id: 2,
        title: "Cobol Ninja",
        company: "Megasoft"
      })
    end
    assert_not_nil( JobListing.where({
      title: "Cobol Ninja",
      provider_id: 2,
      job_id: 1
    }) )
  end
end
