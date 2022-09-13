class AlgorithmsController < ApplicationController
    skip_before_action :authenticate_user
    
    def index
        render json: Algorithm.all 
    end

    def show
        algorithm = Algorithm.find(params[:id])
        render json: algorithm
    end

    def create
        algorithm = Algorithm.create!(a_params)
        render json: algorithm, status: :created
    end

    private

    def a_params
        params.permit("title", "description")
    end

end
