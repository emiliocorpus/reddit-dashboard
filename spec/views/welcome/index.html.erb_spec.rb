require 'rails_helper'

RSpec.describe "welcome/index.html.erb", type: :view do
  describe 'with no current user signed in' do

    it 'should have a nav element' do
      visit '/'
      page.has_css?('nav')
    end
    it 'should have a navbar with a login link' do
      visit '/'
      find_link('Sign in With Reddit').visible?
    end
  end
end
