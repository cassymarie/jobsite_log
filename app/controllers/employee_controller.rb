class EmployeesController < ApplicationController

    
    get '/sitecrew/:id/new' do
        @jobsite = Jobsite.find(params[:id])
        @employees = @jobsite.employees
        erb :'employees/new'
    end

    get '/sitecrew/:id/edit/:employee_id' do
        @jobsite = Jobsite.find(params[:id])
        @employee = Employee.find(params[:employee_id])
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
        redirect "/jobsite/#{jobsite.id}"
    end

    post '/employee/edit/:id' do
        #
        jobsite = params[:jobsite][:id]
        employee = Employee.find(params[:id])
        new_info = params[:employee]
        # binding.pry
        new_info[:title_id] = new_info[:title_id].to_i
        employee.update(new_info)
        redirect "/sitecrew/#{jobsite}/new"
    end

end