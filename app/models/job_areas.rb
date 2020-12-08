class JobArea < ActiveRecord::Base
    belongs_to :jobs
    belongs_to :areas
end