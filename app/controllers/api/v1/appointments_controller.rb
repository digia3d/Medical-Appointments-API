module Api
  module V1
    class AppointmentsController < ApplicationController
      before_action :set_appointment, only: %i[show destroy]

      def index
        appointments = Appointment.all
        render json: appointments.as_json(include: { user: { only: :name }, doctor: { only: :name } }, except: %i[created_at updated_at])
      end

      def show
        render json: @appointment.as_json(include: { user: { only: :name }, doctor: { only: :name } })
      end

      def create
        appointment = Appointment.new(appointment_params)

        return render json: appointment, status: :created if appointment.save

        render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
      end

      def destroy
        appointment = Appointment.find(params[:id])
        appointment.destroy
        head :no_content
      end

      private

      def set_appointment
        @appointment = Appointment.find_by(id: params[:id])
        render json: { error: "Appointment not found" }, status: :not_found unless @appointment
      end

      def appointment_params
        params.require(:appointment).permit(:user_id, :doctor_id, :scheduled_at, :status, :description)
      end
    end
  end
end
