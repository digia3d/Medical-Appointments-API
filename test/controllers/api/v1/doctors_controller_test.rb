require "test_helper"

module Api
  module V1
    class DoctorsControllerTest < ActionDispatch::IntegrationTest
      test "should get index" do
        get doctors_index_url
        assert_response :success
      end

      test "should get show" do
        get doctors_show_url
        assert_response :success
      end

      test "should get create" do
        get doctors_create_url
        assert_response :success
      end
    end
  end
end
