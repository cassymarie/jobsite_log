class EmployeesController < ApplicationController

    
    get '/sitecrew/:id/new' do
        @jobsite = Jobsite.find(params[:id])
        @employees = @jobsite.employees
        erb :'employees/new'
    end

    get '/sitecrew/:id/edit' do
        @jobsite = Jobsite.find(params[:id])
        @employees = @jobsite.employees
        erb :'employees/edit'
    end

    post '/employee/new' do
        employee = Employee.create(
            :first_name => params[:employee][:first_name],
            :last_name => params[:employee][:last_name],
            :title_id => params[:title].to_i
        )
        jobsite = Jobsite.find(params[:jobsite][:id].to_i)
        employee.jobsites << jobsite
        redirect "/jobsites/#{jobsite.id}"
    end
end