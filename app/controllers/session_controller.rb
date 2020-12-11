class SessionController < ApplicationController

    #View Main Log-in Page
    get '/login' do
        session.clear
        erb :'session/new', :layout => :'layouts/layout_signin'
    end

    get '/login/existing' do
        @email = params[:email]
        erb :'session/new', :layout => :'layouts/layout_signin'
    end
    

    # Add User_id to Session (if verified) > goes to Jobsite Main Page
    # (Invalid) sets the error message to be displayed on current page.
    post '/login' do
        @user = User.find_by(email: params[:user][":email"])
        @invalid = false
        #(Valid) User Email exists & password matches
        if @user && @user.authenticate(params[:user][":password"])
            session[:user_id] = @user.id
            redirect '/jobsites'
        else
            if @user.nil?
                @invalid = true
                @error = "Email does not exist, Try again or Signup."
            else
                @error = @user.errors.full_messages.join(" - ")
            end
            erb :'session/new', :layout => :'layouts/layout_signin'
        end

    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end