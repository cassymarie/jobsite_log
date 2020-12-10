class TaskController < ApplicationController

    get '/jobsite/:id/tasks' do
        redirect '/error' if !logged_in?
        @jobsite = Jobsite.find(params[:id])
        redirect '/jobsites' unless @jobsite.users.include?(current_user)

        @tasks = @jobsite.tasks
        erb :'tasks/add', :layout => :'layouts/layout_tasks'
    end
    
    get '/jobsite/:id/task/edit/:task_id' do
        redirect '/error' if !logged_in?
        @jobsite = Jobsite.find(params[:id])
        redirect '/jobsites' unless @jobsite.users.include?(current_user)

        @tasks = @jobsite.tasks
        @task = Task.find(params[:task_id])
        erb :'tasks/edit', :layout => :'layouts/layout_tasks'
    end

    get '/jobsite/:id/tasks/delete/:task_id' do
        redirect '/error' if !logged_in?
        @jobsite = Jobsite.find(params[:id])
        redirect '/jobsites' unless @jobsite.users.include?(current_user)

        @tasks = @jobsite.tasks
        @task = Task.find(params[:task_id])
        erb :'tasks/delete', :layout => :'layouts/layout_tasks'
    end 

    post '/task/new' do
        # binding.pry
        task = Task.create(params[:task])
        jobsite = Jobsite.find(params[:jobsite_id])
        jobsite.tasks << task
        jobsite.save
        redirect "jobsite/#{jobsite.id}/tasks"
    end

    patch '/tasks/edit' do
        
    end



    delete '/tasks/delete/:id' do

    end

end
