require 'rails_helper'

RSpec.describe "Welcomes", type: :request do
  describe "GET #index" do
      before do
          sign_in create(:user)
      end
  end
  
  describe "GET /index" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

end
