class MainController < ApplicationController
    def index
        #flash[:notice] = "Logged in successfully" #fix for persistent flash (only the current request): flash.now[:variable]
        #flash[:alert] = "Invalid email or password"
    end
end
