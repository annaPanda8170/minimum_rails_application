require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#index" do
    it "HTTPレスポンスコード200が返る" do
      get :index
      expect(response).to have_http_status "200"
    end
  end
end
