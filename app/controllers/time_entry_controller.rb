class TimeEntryController < ApplicationController
    get '/jobsite/:id/time_entry' do
        @jobsite = Jobsite.find(params[:id])
        @week_ending = DateTime.parse(params[:week_ending]).to_date
        erb :'time_entries/show', :layout => :'layouts/layout_time_entries'
    end

    post '/jobsite/:id/time_entry/new' do
        @jobsite = Jobsite.find(params[:id])
        @week_ending = DateTime.parse(params[:week_ending]).to_date
        workdate = DateTime.parse(params[:workdate]).to_date
        employee_entry = params[:entry]
            employee_entry.each do |entry|
                employee = entry[:employee]
                hours = entry[:hours]
                    type = 1
                    hours.each do |k,v|
                        if !v=""
                            binding.pry
                            post = TimeEntry.create(employee)
                            post.workdate = workdate
                            post.hours = v.to_f
                            post.type_id = type
                            post.save
                        end
                        type += 1
                    end
            end
        @posted = true
        
        erb :'time_entries/show', :layout => :'layouts/layout_time_entries'
    end
end