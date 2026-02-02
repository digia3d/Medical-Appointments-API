module Api
  module V1
    class AppointmentsController < ApplicationController
      def index
        appointments = Appointment.all
        render json: appointments
      end

      def show
        appointment = Appointment.find(params[:id])
        render json: appointment
      end

      def create
        appointment = Appointment.new(appointment_params)

        return render json: appointment, status: :created if appointment.save

        render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
      end

      def destroy
        record = Appointment.find(params[:id])
        record.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Appointment not found" }, status: :not_found
      end

      private

      def appointment_params
        params.require(:appointment).permit(:user_id, :doctor_id, :scheduled_at, :status, :description)
      end
    end
  end
end
