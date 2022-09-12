class AlgorithmsController < ApplicationController
    def index
        render json: Algorithm.all 
    end

    def show
        algorithm = Algorithm.find(params[:id])
        render json: algorithm
    end
end
