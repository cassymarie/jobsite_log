class JobsiteController < ApplicationController

    get '/jobsites' do
        erb :'jobsites/index'
    end

end