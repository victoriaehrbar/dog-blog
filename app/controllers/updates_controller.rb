class UpdatesController < ApplicationController
    before_action :require_login , except: [:index, :show]

    def new
        @dog = Dog.find_by_id(params[:dog_id])
        @update = @dog.updates.build
    end
end
