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
            redirect_to "/"
        else
            flash.alert = "Failed"
        end
    end

    
    private
        def kitten_params
            params.require(:kitten).permit(:name, :age, :cuteness, :softness)
        end
    end
