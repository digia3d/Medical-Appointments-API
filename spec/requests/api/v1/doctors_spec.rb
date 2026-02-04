require "rails_helper"

RSpec.describe "Doctors API", type: :request do
  describe "GET /api/v1/doctors" do
    let!(:doctors) { create_list(:doctor, 3) }

    before { get "/api/v1/doctors" }

    it "returns a list of doctors" do
      expect(response).to have_http_status(:ok)
    end

    it "returns doctors in JSON format" do
      json = response.parsed_body

      expect(json).to be_an(Array)
      expect(json.length).to eq(3)
    end
  end

  describe "GET /api/v1/doctors/:id" do
    let(:doctor) { create(:doctor) }

    before do
      doctor
      get "/api/v1/doctors/#{doctor.id}"
    end

    it "returns the doctor details" do
      expect(response).to have_http_status(:ok)
    end

    it "returns the correct doctor in JSON format" do
      json = response.parsed_body

      expect(json["id"]).to eq(doctor.id)
      expect(json["name"]).to eq(doctor.name)
      expect(json["specialization"]).to eq(doctor.specialization)
    end
  end

  describe "GET /api/v1/doctors/:id when doctor does not exist" do
    before { get "/api/v1/doctors/999999" }

    it "returns a 404 not found" do
      expect(response).to have_http_status(:not_found)
    end

    it "returns an error message" do
      json = response.parsed_body
      expect(json["error"]).to eq("Doctor not found")
    end
  end

  describe "GET /api/v1/doctors when no doctors exist" do
    before do
      Doctor.destroy_all
      get "/api/v1/doctors"
    end

    it "returns an empty array" do
      expect(response).to have_http_status(:ok)
      json = response.parsed_body
      expect(json).to eq([])
    end
  end
end
