class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        #@user = User.new(params[:user]) #unsecure
        @user = User.new(user_params)
        
        if @user.save
            #cookie[:user_id] #that is going to be something that anyone can change -> bad
            session[:user_id] = @user.id #this way is set on the server side so no one can mess with it
            redirect_to root_path, notice: "Your account has been succesfully created."
        else
            #flash[:alert] = "Something was wrong"
            @user.errors.each do |attribute, message|
                puts "#{attribute.full_message} #{message}"
            end
            render :new, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end