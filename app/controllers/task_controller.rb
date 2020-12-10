class TaskController < ApplicationController
    get 'jobsite/:id/tasks' do
        redirect '/error' if !logged_in?
        @jobsite = Jobsite.find(params[:id])
        redirect '/jobsites' unless @jobsite.users.include?(current_user)
    end
end
