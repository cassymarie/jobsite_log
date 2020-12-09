class EmployeesController < ApplicationController

    get '/sitecrew/:id/edit' do

    end

    post '/employee/new' do
        #binding.pry
        employee = Employee.create(
            :first_name => params[:employee][:first_name],
            :last_name => params[:employee][:last_name],
            :title_id => params[:title].to_i
        )
        # employee.title_id = params[:title].to_i
        jobsite = Jobsite.find(params[:jobsite][:id].to_i)
        employee.jobsites << jobsite
        redirect "/jobsites/#{jobsite.id}"
    end
end