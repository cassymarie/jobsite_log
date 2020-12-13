class TimeEntryController < ApplicationController
    get '/jobsite/:id/time_entry' do
        @jobsite = Jobsite.find(params[:id])
        @week_ending = DateTime.parse(params[:week_ending]).to_date
        @startIndex = 5
        erb :'time_entries/show', :layout => :'layouts/layout_time_entries'
    end

    post '/jobsite/:id/time_entry/new' do
        @jobsite = Jobsite.find(params[:id])
        
        binding.pry
        redirect "/jobsite/#{@jobsite.id}/time_entry"
    end
end