class Project < ActiveRecord::Base
  belongs_to :user
  validates :service_name,:time_interval,:website, presence: true
end
