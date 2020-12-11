class JobsiteController < ApplicationController
    
    get '/jobsites' do
        redirect '/error' if !logged_in? 
        @user = current_user
        @jobsites = @user.jobsites
        erb :'jobsites/index', :layout => :'layouts/layout_jobsite'
    end

    get '/jobsites/new' do
        redirect '/error' if !logged_in? 
        @user = current_user
        @jobsites = @user.jobsites
        erb :'jobsites/new', :layout => :'layouts/layout_jobsite'
    end

    get '/jobsite/:id' do 
        redirect '/error' if !logged_in?
        @jobsite = Jobsite.find(params[:id])
        redirect '/jobsites' unless @jobsite.users.include?(current_user)
        
        @site_areas = @jobsite.site_areas
        @employees = @jobsite.employees
        @jobs = @jobsite.jobs
        @tasks = @jobsite.tasks
        erb :'jobsites/show', :layout => :'layouts/layout_jobsite'
    end

    post '/jobsite/new' do
        user = current_user
        jobsite = Jobsite.create(params[:jobsite])
        user.jobsites << jobsite
        redirect '/jobsites'
    end


end