class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def reddit
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in @user
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end


#   headers = {"Authorization": "bearer #{token_here}", "User-Agent": "RedditWebDashboard/0.1 by Emilio Corpus"}
#   response = requests.get("https://oauth.reddit.com/api/v1/me", headers=headers)


end
