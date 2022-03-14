# ログインテストはvue側に持たせているのでパスする

#require 'rails_helper'
#
#RSpec.describe "RegistrationsController", type: :request do
#  let!(:user) { create(:user) }
#
#  describe "login" do
#    before do
#      post api_v1_user_session_path, params: { email: "test@example.com", password: "testuser"}
#    end
#
#    it "ログインできる" do
#      expect(response.status).to eq 200
#    end
#  end
#
#  describe "logout" do
#
#    before do
#      post api_v1_user_session_path, params: { email: "test@example.com", password: "testuser"}
#      binding.pry
#      delete destroy_api_v1_user_session_path
#    end
#
#    it "ログアウトできる" do
#      expect(response.status).to eq 200
#    end
#  end
#end
