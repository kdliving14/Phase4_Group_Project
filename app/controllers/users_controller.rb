class UsersController < ApplicationController
    skip_before_action :authenticate_user, only: :create

    def index
        render json: User.all 
    end

    def show
        user = User.find_by(id: session[:user_id])
        if user
          render json: user
        else
          render json: { error: "Not authorized" }, status: :unauthorized
        end
    end
end
