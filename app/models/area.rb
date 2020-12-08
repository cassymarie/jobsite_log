class Area < ActiveRecord::Base
    has_many :job_areas
    has_many :jobs, through: :job_areas
    
    validates :code, presence: true
    validates :code, uniqueness: true
    validates :name, presence: true
end