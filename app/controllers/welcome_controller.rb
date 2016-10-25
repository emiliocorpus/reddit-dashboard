class WelcomeController < ApplicationController

  def index
    if current_user
      current_client = RedditClient.new(current_user)
      binding.pry
    end
  end
end
