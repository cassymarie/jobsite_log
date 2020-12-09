class JobController < ApplicationController

    get '/jobsite/:id/jobs/new' do
        @jobsite = Jobsite.find(params[:id])
        @jobs = @jobsite.jobs
        @site_areas = @jobsite.site_areas
        erb :'jobs/new'
    end

    get '/jobsite/:id/jobs/edit/:job_id' do
        @jobsite = Jobsite.find(params[:id])
        @job = Job.find(params[:job_id])
        @jobs = @jobsite.jobs
        @site_areas = @jobsite.site_areas
        erb :'jobs/edit'
    end

    get '/jobsite/:id/jobs/edit' do
        @jobsite = Jobsite.find(params[:id])
        @jobs = @jobsite.jobs
        if @jobs.size == 0 
            redirect "/jobsite/#{@jobsite.id}/jobs/new"
        else
            @site_areas = @jobsite.site_areas
            erb :'jobs/edit'
        end
    end

    get '/jobsite/:id/jobs/delete/:job_id' do
        @jobsite = Jobsite.find(params[:id])
        @job = Job.find(params[:job_id])
        erb :'jobs/delete'
    end

    post '/jobsite/:id/jobs/new/area' do
        @job = Job.find(params[:job_id].to_i)
        new_area = Area.create(:code => params[:area][:code].upcase, :name => params[:area][:name].capitalize)
        @job.areas << new_area
        @jobsite = Jobsite.find(params[:id])
        @jobs = @jobsite.jobs
        @site_areas = @jobsite.site_areas
        new_area.name = params[:area][:name].capitalize
        new_area.save
        erb :'jobs/edit'
    end

    post '/jobsite/:id/jobs/new' do
        @jobsite = Jobsite.find(params[:id])
        job = Job.create(params[:job])
        @jobsite.jobs << job
        areas = params[:areas]
        areas.each do |a|
            area = Area.find(a.to_i)
            job.areas << area
        end
        job.save
        redirect "jobsite/#{@jobsite.id}/jobs/new"
    end

    post '/jobsite/:id/jobs/edit/:job_id' do
        job = Job.find(params[:job_id].to_i)
        job.update(params[:job])
        areas = params[:areas]
            job.areas.clear
            areas.each do |a|
                area = Area.find(a.to_i)
                job.areas << area
            end
        job.save
        redirect "jobsite/#{params[:id]}"
    end


end