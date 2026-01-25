require "test_helper"

module Api
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      test "should get index" do
        get api_v1_users_url
        assert_response :success
      end

      test "should create user" do
        post api_v1_users_url, params: { user: { name: "Test User" } }, as: :json
        assert_response :created
      end

      test "should show user" do
        user = User.create!(name: "Sample")
        get api_v1_user_url(user)
        assert_response :success
      end
    end
  end
end
