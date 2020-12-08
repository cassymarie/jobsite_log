class Job < ActiveRecord::Base
    validates :job_number, presence: true
    validates :job_number, uniqueness: true

    belongs_to :jobsite
    has_many :job_areas
    has_many :areas, through: :job_areas
end