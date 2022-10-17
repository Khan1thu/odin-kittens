class KittenController < ApplicationController
    def index
        @kitten = Kitten.all
    end

    def show
        @k = Kitten.find(params[:id])
    end
end
