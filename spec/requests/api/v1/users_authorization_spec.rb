require 'rails_helper'

RSpec.describe 'Users authorization', type: :request do
  let!(:user) { create(:user) }

  let(:token) do
    JWT.encode({ user_id: user.id },
               Rails.application.secrets.secret_key_base)
  end

  let(:headers) do
    { 'Authorization' => "Bearer #{token}" }
  end

  describe 'GET /api/v1/users' do
    context 'when no token is provided' do
      before { get '/api/v1/users' }

      it 'returns unauthorized' do
        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to include('Unauthorized')
      end
    end

    context 'when valid token is provided' do
      before do
        create_list(:user, 2)
        get '/api/v1/users',
            headers: headers
      end

      it 'returns ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns an array of users with id and name' do
        json = response.parsed_body

        expect(json).to be_an(Array)
        expect(json.first.keys).to contain_exactly('id', 'name')
      end
    end
  end

  describe 'GET /api/v1/users/:id' do
    context 'when no token is provided' do
      before { get "/api/v1/users/#{user.id}" }

      it 'returns unauthorized' do
        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to include('Unauthorized')
      end
    end

    context 'when valid token is provided' do
      before { get "/api/v1/users/#{user.id}", headers: headers }

      it 'returns ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns the user with id and name' do
        json = response.parsed_body

        expect(json['id']).to eq(user.id)
        expect(json['name']).to eq(user.name)
      end
    end
  end

  describe 'DELETE /api/v1/users/:id' do
    context 'when no token is provided' do
      before { delete "/api/v1/users/#{user.id}" }

      it 'returns unauthorized' do
        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to include('Unauthorized')
      end
    end

    context 'when valid token is provided' do
      before { delete "/api/v1/users/#{user.id}", headers: headers }

      it 'returns ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
