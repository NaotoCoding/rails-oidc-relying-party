require "rails_helper"

RSpec.describe "Sessions", type: :request do
  describe "GET /users/sign_in" do
    it "ログインしていない時、200を返す" do
      get new_user_session_path
      expect(response).to have_http_status 200
    end

    it "ログインしている時、root_pathにリダイレクトされる" do
      sign_in create(:user)
      get new_user_session_path
      expect(response).to redirect_to root_path
    end
  end
end
