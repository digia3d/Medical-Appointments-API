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

  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialization, :photo, :user_id)
  end
end
