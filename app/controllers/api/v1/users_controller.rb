module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show destroy]

      #  GET /users
      def index
        users = User.all
        render json: users.as_json(only: %i[id name])
      end

      # GET /users/:id
      def show
        render json: @user.as_json(only: %i[id name])
      end

      # POST /users
      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy
        render json: { message: "User deleted successfully" }
      end

      private

      def set_user
        @user = User.find_by(id: params[:id])
        render json: { error: "User not found" }, status: :not_found unless @user
      end

      def user_params
        params.require(:user).permit(:name)
      end
    end
  end
end
