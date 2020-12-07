class SessionController < ApplicationController

    #View Main Sign-in Page
    get '/signin' do
        erb :'session/new'
    end

    post '/signin' do
        @user = User.find_by_id(params[:id])

        redirect to "/jobsites"
    end
end