require 'rails_helper'

RSpec.describe 'Auth API', type: :request do
  let!(:user) { create(:user, email: 'alex@example.com', password: 'password', password_confirmation: 'password') }

  describe 'POST /api/v1/login' do
    context 'with valid credentials' do
      before do
        post '/api/v1/login',
             params: { email: user.email, password: 'password' },
             headers: { 'ACCEPT' => 'application/json' }
      end

      it 'returns a token' do
        json = response.parsed_body
        expect(json['token']).not_to be_nil
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid credentials' do
      before do
        post '/api/v1/login',
             params: { email: user.email, password: 'wrongpass' },
             headers: { 'ACCEPT' => 'application/json' }
      end

      it 'returns unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
