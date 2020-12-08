class Jobsite < ActiveRecord::Base
    has_many :user_jobsites
    has_many :users, through: :user_jobsites
    has_many :jobs
end