require "rails_helper"

RSpec.describe "API::V1::Appointments", type: :request do
  let!(:user) { create(:user) }
  let!(:doctor) { create(:doctor) }

  let(:valid_attributes) do
    {
      user_id: user.id,
      doctor_id: doctor.id,
      description: "Regular check-up",
      scheduled_at: 1.day.from_now,
      status: "scheduled"
    }
  end

  describe "GET /api/v1/appointments" do
    it "returns a list of appointments" do
      create(:appointment)
      get "/api/v1/appointments"
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body.size).to be >= 1
    end
  end

  describe "POST /api/v1/appointments" do
    context "with valid params" do
      it "creates a new appointment" do
        expect do
          post "/api/v1/appointments", params: { appointment: valid_attributes }
        end.to change(Appointment, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "returns errors" do
        post "/api/v1/appointments", params: { appointment: { description: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /api/v1/appointments/:id" do
    it "deletes the appointment" do
      appointment = create(:appointment)
      expect do
        delete "/api/v1/appointments/#{appointment.id}"
      end.to change(Appointment, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
