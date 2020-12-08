class Area < ActiveRecord::Base
    #belongs_to :jobs
    has_many :job_areas
    has_many :jobs, through: :job_areas
end