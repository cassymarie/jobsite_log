class SessionController < ApplicationController

    #View Main Log-in Page
    get '/login' do
        erb :'session/new'
    end

    # Add User_id to Session (if verified) > goes to Jobsite Main Page
    # (Invalid) sets the error message to be displayed on current page.
    post '/login' do
        @user = User.find_by(email: params[:user][":email"])
        # binding.pry
        #(Valid) User Email exists & password matches
        if @user && @user.authenticate(params[:user][":password"])
            session[:user_id] = @user.id
            redirect '/jobsites'
        else
            @error = @user.errors.full_messages.join(" - ")
            erb :'session/new'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end