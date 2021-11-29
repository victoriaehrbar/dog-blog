class DogsController < ApplicationController
    before_action :require_login, except: [:index, :show]
    before_action :find_dog, only [:show, :edit, :update, :destroy]
    before_action :current_user

    def index
        @dogs = Dog.all 
    end

    def show
        @updates = @dog.updates.high_training_score
    end

    def new
        @dog = Dog.new
    end

    def create
        @breeds = ["Golden Retriever", "German Shepherd", "Husky", "Collie", "Other"]
        @dog = Dog.find_by(dog_name: params[:dog][:dog_name])
            if @dog
                flash[:message] = "This dog already exists, please write an update about this dog or add a new one"
                redirect_to dogs_path
            else
                @dog = Dog.new(dog_params)
                @dog.user_id = session[:user_id]
                @dog.save
                if !@dog.breed_id
                    render :new
                else
                    redirect_to dog_path(@dog)
                end
            end
        end

        def edit
        end

        def update
        end

end
