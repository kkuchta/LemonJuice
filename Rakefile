# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

LemonJuice::Application.load_tasks

desc "Load the latest jobs from the providers"
task :update_listings => :environment do
    job_data = AngelList.getJobs();
    job_data.each do |data|
      JobListing.ingest_job_listing( data )
    end
end

desc "Purely for early testing: delete all jobs and listings"
task :clear_all => :environment do
    Job.delete_all
    JobListing.delete_all
end
