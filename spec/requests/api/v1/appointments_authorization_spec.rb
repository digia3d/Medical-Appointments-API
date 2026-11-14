require 'rails_helper'

RSpec.describe 'Appointments authorization', type: :request do
  let!(:user) { create(:user) }
  let!(:doctor) { create(:doctor) }
  let!(:appointment) { create(:appointment, user: user, doctor: doctor) }

  let(:token) do
    JWT.encode(
      { user_id: user.id },
      Rails.application.secrets.secret_key_base
    )
  end

  describe 'GET /api/v1/appointments' do
    context 'when no token is provided' do
      before { get '/api/v1/appointments' }

      it 'returns unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when token is provided' do
      before do
        get '/api/v1/appointments',
            headers: { 'Authorization' => "Bearer #{token}" }
      end

      it 'returns ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET /api/v1/appointments' do
    let!(:user) { create(:user) }
    let!(:token) { jwt_token_for_user(user) }

    context 'when a valid token is provided' do
      before do
        get '/api/v1/appointments',
            headers: { 'Authorization' => "Bearer #{token}" }
      end

      it 'returns ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
