module Api
  module V1
    class UsersController < ApplicationController
      #  GET /users
      def index
        users = User.all
        render json: users
      end

      # GET /users/:id
      def show
        user = User.find(params[:id])
        render json: user
      rescue ActiveRecord::RecordNotFound
        render json: { error: "User not found" }, status: :not_found
      end

      # POST /users
      def create
        user = User.new(user_params)
        return unless user.saverender json: user, status: :created_atelse

        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end

      def destroy
        record = User.find(params[:id])
        record.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: "User not found" }, status: :not_found
      end

      private

      def user_params
        params.require(:user).permit(:name)
      end
    end
  end
end
