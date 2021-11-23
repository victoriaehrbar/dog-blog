class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def create     #verifies if user is in the system
        if (params[:user][:email]) == "" || (params[:user][:password]) == ""
            flash[:message] = "Invalid login credentials. Please try again."
            render '/sessions/new'
        else
            @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password ])
                        #compares password to the password_digest hash
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:message] = "Sorry, something went wrong. Please try again. "
                redirect_to login_path
            end
        end
    end

    def destroy
        #byebug
        session.delete(:user_id)
        redirect_to "/"
    end

end