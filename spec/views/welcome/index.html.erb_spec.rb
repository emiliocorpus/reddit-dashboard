require 'rails_helper'

RSpec.describe "welcome/index.html.erb", type: :view do
  describe 'with no current user signed in' do
    it 'should have a navbar with a login link' do
      visit root_path
      expect(response.body).to have_link("Sign in With Reddit")
    end
  end
end
