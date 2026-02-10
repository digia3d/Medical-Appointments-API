require 'rails_helper'

RSpec.describe 'Doctors authorization', type: :request do
  let!(:user) { create(:user) }
  let!(:doctor) { create(:doctor) }
  let(:token) do
    JWT.encode({ user_id: user.id },
               Rails.application.secrets.secret_key_base)
  end
  let(:headers) { { 'Authorization' => "Bearer #{token}" } }

  describe 'GET /api/v1/doctors' do
    context 'when no token is provided' do
      before { get '/api/v1/doctors' }

      it 'returns unauthorized' do
        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to include('Unauthorized')
      end
    end

    context 'when valid token is provided' do
      before { get '/api/v1/doctors', headers: headers }

      it 'returns ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns doctors list' do
        json = response.parsed_body
        expect(json).to be_an(Array)
      end
    end
  end

  describe 'GET /api/v1/doctors/:id' do
    let!(:doctor) { create(:doctor) }

    context 'when no token is provided' do
      before { get "/api/v1/doctors/#{doctor.id}" }

      it 'returns unauthorized' do
        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to include('Unauthorized')
      end
    end

    context 'when valid token is provided' do
      before { get "/api/v1/doctors/#{doctor.id}", headers: headers }

      it 'returns doctor details' do
        json = response.parsed_body
        expect(json['id']).to eq(doctor.id)
        expect(json['name']).to eq(doctor.name)
      end
    end
  end
end
