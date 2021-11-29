class UpdatesController < ApplicationController
    before_action :require_login  , except: [:index, :show]
   

    def index
        if params[:dog_id] #if nested. only show updates for that dog
            @dog = Dog.find_by_id(params[:dog_id])
            @updates = @dog.updates
        else    #show all the reviews in db
            @updates = Update.all
        end
    end

    def show
        @update = Update.find_by_id(params[:id])
        @dog = @update.restaurant
    end

    def new
        @dog = Dog.find_by_id(params[:dog_id])
        @update = @dog.reviews.build
    end

    def create
        @update = Update.new(update_params)
        @dog = Dog.find_by_id(params[:update][:dog_id])
        @update.user_id = current_user.id
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

    def change
        @dog = Dog.find_by_id(params[:review][:dog_id])
        @update = Update.find_by_id(params[:id])
        if @update.change(update_params)
            redirect_to update_path(@update)
        else
            render :edit
        end
    end

    def destroy
        @update = Update.find_by_id(params[:id])
        @update.destroy
        redirect_to update_path
    end

    private

    def update_params
        params.require(:update).permit(:title, :content, :training_score, :dog_id)
    end

    
end