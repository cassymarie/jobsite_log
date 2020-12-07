class SessionController < ApplicationController

    #View Main Sign-in Page
    get "/" do
        erb :'session/new'
    end
end