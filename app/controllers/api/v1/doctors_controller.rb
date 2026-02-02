module Api
  module V1
    class DoctorsController < ApplicationController
      before_action :set_doctor, only: %i[show destroy]

      def index
        doctors = Doctor.all
        render json: doctors.as_json(only: %i[id name specialization])
      end

      def show
        render json: @doctor.as_json(only: %i[id name specialization])
      end

      def create
        doctor = Doctor.new(doctor_params)

        if doctor.save
          render json: doctor, status: :created
        else
          render json: { errors: doctor.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @doctor.destroy
        render json: { message: "Doctor deleted successfully" }
      end

      private

      def set_doctor
        @doctor = Doctor.find_by(id: params[:id])
        render json: { error: "Doctor not found" }, status: :not_found unless @doctor
      end

      def doctor_params
        params.require(:doctor).permit(:name, :specialization, :photo, :user_id)
      end
    end
  end
end
