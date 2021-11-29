class DogsController < ApplicationController
    before_action :require_login, except: [:index, :show]
    before_action :find_dog, only [:show, :edit, :update, :destroy]
    before_action :current_user

    def index
        @dogs = Dog.all 
    end
end
