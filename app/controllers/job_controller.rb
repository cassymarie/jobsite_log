class JobController < ApplicationController

    get '/jobsite/:id/jobs/new' do
        @jobsite = Jobsite.find(params[:id])
        @jobs = @jobsite.jobs
        @site_areas = @jobsite.site_areas
        # binding.pry
        erb :'jobs/new'
    end


    get '/jobsite/:id/jobs/show' do
        @jobsite = Jobsite.find(params[:id])
        @jobs = @jobsite.jobs
        @site_areas = @jobsite.site_areas
        erb :'jobs/show'
    end
 
    post '/jobsite/:id/jobs/new' do
        @jobsite = Jobsite.find(params[:id])
        job = Job.create(params[:job])
        @jobsite.jobs << job
        # @site_areas = @jobsite.site_areas
        # binding.pry
        redirect "jobsite/#{@jobsite.id}"
    end

    patch '/jobsite/:id/jobs/edit' do
        @jobsite = Jobsite.find(params[:id])
        
    end

end