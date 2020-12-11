class JobsiteController < ApplicationController
    
    get '/jobsites' do
        redirect '/error' if !logged_in? 
        @jobsites = current_user.jobsites
        erb :'jobsites/index', :layout => :'layouts/layout_jobsite'
    end

    get '/jobsites/new' do
        redirect '/error' if !logged_in? 
        @jobsites = current_user.jobsites
        erb :'jobsites/new', :layout => :'layouts/layout_jobsite'
    end

    get '/jobsite/:id' do 
        redirect '/error' if !logged_in?
        @jobsite = Jobsite.find(params[:id])
        redirect '/jobsites' unless @jobsite.users.include?(current_user)
        erb :'jobsites/show', :layout => :'layouts/layout_jobsite'
    end

    post '/jobsite/new' do
        jobsite = Jobsite.create(params[:jobsite])
        current_user.jobsites << jobsite
        redirect '/jobsites'
    end


end