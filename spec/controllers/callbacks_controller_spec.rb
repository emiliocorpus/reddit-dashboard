require 'rails_helper'

RSpec.describe CallbacksController, type: :controller do

  describe "GET #reddit" do
    it "returns http success" do
      get :reddit
      expect(response).to have_http_status(:success)
    end
  end

end
