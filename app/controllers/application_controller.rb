require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    redirect '/error' if !logged_in?
    @jobsite = Jobsite.find(params[:id])
    redirect '/jobsites' unless @jobsite.users.include?(current_user)

    erb :'session/new', :layout => :'layouts/layout_signin'
  end

  get '/failure' do
    
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end
  end
  
end