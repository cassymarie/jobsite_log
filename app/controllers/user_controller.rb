class UserController < ApplicationController

    #View Main Sign-Up Page
    get '/signup' do
        erb :'users/new', :layout => :'layouts/layout_signin'
    end

    get '/error' do
        erb :error, :layout => :'layouts/layout_signin'
    end

    #Create a new user (if valid)
    post '/signup' do
        @user = User.new(params[:user])
        if @user.save
            session[:user_id] = @user.id
            redirect to '/jobsites'
        else
            @error = @user.errors.full_messages.join(" - ")
            erb :'users/new', :layout => :'layouts/layout_signin'
        end
    end

end
