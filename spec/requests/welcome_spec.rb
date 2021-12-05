require 'rails_helper'

RSpec.describe "Welcomes", type: :request do
  before do
    sign_in create(:user)
  end

  describe "GET /index" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(200)
    end
  end

end
