class Job < ActiveRecord::Base
  validates :role, :inclusion => { in: ['developer', 'designer','other'] }
end
