class Job < ActiveRecord::Base
  has_many :job_listings
  validates :role, :inclusion => { in: ['developer', 'designer','other'] }
end
