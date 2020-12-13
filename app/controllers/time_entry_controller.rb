class TimeEntryController < ApplicationController
    get '/jobsite/:id/time_entry' do
        @jobsite = Jobsite.find(params[:id])
        @week_ending = params[:week_ending]
         binding.pry
        erb :'time_entries/show', :layout => :'layouts/layout_time_entries'
    end

    post '/jobsite/:id/time_entry/new' do
        @jobsite = Jobsite.find(params[:id])
        binding.pry
        redirect "/jobsite/#{@jobsite.id}/time_entry"
    end
end