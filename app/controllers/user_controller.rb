class UserController < ApplicationController

    get '/signup' do
        erb :'users/new'
    end

    post '/signup' do
        binding.pry
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect to '/jobsites'
        else
           # @error = user.errors.full_messages.join(" - ")
            erb :'error'
        end
    end

end
