class Jobsite < ActiveRecord::Base
    has_many :user_jobsites
    has_many :users, through: :user_jobsites
    has_many :jobs

    def site_areas
        areas=[]
        self.jobs.each do |job|
            job.areas.each do |area|
                areas << area unless areas.include?(area)
            end
        end
        areas
    end
end