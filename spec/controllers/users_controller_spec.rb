require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #profile2" do
    it "returns http success" do
      get :profile2
      expect(response).to have_http_status(:success)
    end
  end

end
