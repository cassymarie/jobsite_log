class JobsiteController < ApplicationController

    get '/jobsites' do
        @jobsites = Jobsite.all
        erb :'jobsites/index'
    end

end