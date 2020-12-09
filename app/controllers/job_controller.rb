class JobController < ApplicationController

    get '/jobsite/:id/jobs/new' do
        @jobsite = Jobsite.find(params[:id])
        @jobs = @jobsite.jobs
        @site_areas = @jobsite.site_areas
        #@job_edit = nil
        # binding.pry
        erb :'jobs/new'
    end

    # get '/jobsite/:id/jobs/new/area' do
    #     @jobsite = Jobsite.find(params[:id])
    #     @jobs = @jobsite.jobs
    #     @site_areas = @jobsite.site_areas
    #     @job_edit = params[:job]
    #     erb :'jobs/new'
    # end

    get '/jobsite/:id/jobs/edit/:job_id' do
    end

    get '/jobsite/:id/jobs/edit' do
        @jobsite = Jobsite.find(params[:id])
        @jobs = @jobsite.jobs
        if @jobs.size == 0 
            #erb :'jobs/new'
            redirect "/jobsite/#{@jobsite.id}/jobs/new"
        else
            @site_areas = @jobsite.site_areas
            erb :'jobs/edit'
        end
        # binding.pry
        
    end

    get '/jobsite/:id/jobs/delete/:job_id' do
        @jobsite = Jobsite.find(params[:id])
        @job = Job.find(params[:job_id])
        erb :'jobs/delete'
    end



    post '/jobsite/:id/jobs/new/area' do
        new_area = Area.create(:code => params[:area][:code].upcase, :name => params[:area][:code].capitalize)
        @jobsite = Jobsite.find(params[:id])
        @jobs = @jobsite.jobs
        @site_areas = @jobsite.site_areas
        @site_areas << new_area
        @site_areas.sort_by {|k, v| [v, k]}
        @job_edit = params[:job]

        erb :'jobs/edit'
    end

    post '/jobsite/:id/jobs/new' do
        @jobsite = Jobsite.find(params[:id])
        job = Job.create(params[:job])
        @jobsite.jobs << job
        
        redirect "jobsite/#{@jobsite.id}/jobs/new"
    end

    patch '/job/edit' do
        
    end


end