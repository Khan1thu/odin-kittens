class KittenController < ApplicationController

    def index
        @kitten = Kitten.all
    end

    def show
        @k = Kitten.find(params[:id])
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params) 
        if @kitten.save
            flash.alert = "You saved!"
            redirect_to @kitten
        else
            flash.alert = "Failed"
        end
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def update
        @kitten = Kitten.find(params[:id])

        if @kitten.update(kitten_params)
          flash[:success] = "Your kitten has been updated!"
          redirect_to @kitten
        else
          flash.now[:error] = "The kitten couldn't be updated, please fix your errors."
          render :edit, status: :unprocessable_entity
        end
    end
    
    private
        def kitten_params
            params.require(:kitten).permit(:name, :age, :cuteness, :softness)
        end
    end
