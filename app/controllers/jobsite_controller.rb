class JobsiteController < ApplicationController
    
    get '/jobsites' do
        
        redirect '/error' if !logged_in?
        binding.pry
        @user = current_user
        
        user_sites = []
        UserJobsite.all.each {|site|user_sites << site.jobsite_id if site.user_id == @user.id}
        @jobsites = Jobsite.all.select {|site| user_sites.include?(site.id)}
        erb :'jobsites/index', :layout => :'layouts/layout_jobsite'
    end

    get '/jobsite/:id' do 
        @jobsite = Jobsite.find(params[:id])
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