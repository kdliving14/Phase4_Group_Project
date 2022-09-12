class SolutionsController < ApplicationController
    def index
        render json: Solution.all
    end

    def show
        solution = Solution.find(params[:id])
        render json: solution
    end

    def create
        solution = Solution.create!(s_params)
        render json: solution, status: :created
    end

    def update
        solution = Solution.find(params[:id])
        solution.update!(s_params)
        render json: solution, status: :accepted
    end

    def destroy
        solution = Solution.find(params[:id])
        solution.destroy
        head :no_content
    end

    private

    def s_params
        params.permit(:user_id, :algorithm_id, :solution, :time_complexity, :space_complexity)
    end
end
