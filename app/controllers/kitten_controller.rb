class KittenController < ApplicationController
    def index
        @kitten = Kitten.all
    end
end
