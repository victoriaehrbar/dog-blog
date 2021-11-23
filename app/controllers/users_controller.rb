class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        # byebug
        @user = User.new(user_params)
        if @user.save
            #log user in
            session[:user_id] = @user.id 
            #redirect to show page
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        @dogs = Dog.all

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
