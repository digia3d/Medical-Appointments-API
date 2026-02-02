module Api
  module V1
    class DoctorsController < ApplicationController
      def index
        doctors = Doctor.all
        render json: doctors
      end

      def show
        doctor = Doctor.find(params[:id])
        render json: doctor
      end

      def create
        doctor = Doctor.new(doctor_params)

        unless doctor.save
          return render(
            json: { errors: doctor.errors.full_messages },
            status: :unprocessable_entity
          )
        end

        render json: doctor, status: :created
      end

      def destroy
        record = Doctor.find(params[:id])
        record.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Doctor not found" }, status: :not_found
      end

      private

      def doctor_params
        params.require(:doctor).permit(:name, :specialization, :photo, :user_id)
      end
    end
  end
end
