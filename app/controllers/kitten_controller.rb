class KittenController < ApplicationController

    def index
        @kitten = Kitten.all
        
        respond_to do |format|
            format.html # index.html.erb
            format.json { render :json => @kittens }
        end
    end

    def show
        @k = Kitten.find(params[:id])

        respond_to do |format|
            format.html
            format.json { render :json => @kitten }
        end
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

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.destroy

        flash[:notice] = "Your kitten has been deleted."
        redirect_to root_path, status: :see_other
    end
    
    private
        def kitten_params
            params.require(:kitten).permit(:name, :age, :cuteness, :softness)
        end
    end
