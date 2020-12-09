class JobsiteController < ApplicationController
    
    get '/jobsites' do
        @user = current_user
        user_sites = []
        
        UserJobsite.all.each {|site|user_sites << site.jobsite_id if site.user_id == @user.id}
        @jobsites = Jobsite.all.select {|site| user_sites.include?(site.id)}
        erb :'jobsites/index'
    end

    get '/jobsite/:id/jobs/new' do
        @jobsite = Jobsite.find(params[:id])
        @jobs = @jobsite.jobs
        @site_areas = @jobsite.site_areas
        binding.pry
        erb :'jobs/new'
    end


    get '/jobsite/:id' do 
        @jobsite = Jobsite.find(params[:id])
        @jobs = @jobsite.jobs
        @site_areas = @jobsite.site_areas
        @employees = @jobsite.employees
        
        erb :'jobsites/show'
    end


end