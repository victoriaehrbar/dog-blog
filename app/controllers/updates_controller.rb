class UpdatesController < ApplicationController
    before_action :require_login  , except: [:index, :show]
   

    def index
        if params[:dog_id] #if nested. only show updates for that dog
            @dog = Dog.find_by_id(params[:dog_id])
            @updates = @dog.updates
        else    #show all reviews in database
            @updates = Update.all
        end
    end

    def show
        # byebug
        @update = Update.find_by_id(params[:id])
        @dog = @update.dog
    end

    def new
        @dog = Dog.find_by_id(params[:dog_id])
        @update = @dog.updates.build
    end

    def create
        @update = Update.new(update_params)
        @dog = Dog.find_by_id(params[:update][:dog_id])
        @update.user_id = current_user.id
        #byebug
        if @update.save 
            redirect_to update_path(@update)
        else
            render :new
        end
     end

    def edit
        @dog = Dog.find_by(id: params[:id])
        @update = Update.find_by_id(params[:id])
    end

    def update
        # byebug
        @dog = Dog.find_by_id(params[:update][:dog_id])
        @update = Update.find_by_id(params[:id])
        if @update.update(update_params)
            redirect_to update_path(@update)
        else
            render :edit
        end
    end

    def destroy
        @update = Update.find_by_id(params[:id])
        @update.destroy
        redirect_to updates_path
    end

    private

    def update_params
        params.require(:update).permit(:title, :content, :training_score, :dog_id)
    end

    
end