class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def reddit
    @user = User.from_omniauth(request.env["omniauth.auth"])
    binding.pry
    if @user
      # sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      # set_flash_message(:notice, :success, :kind => "Reddit") if is_navigational_format?
      sign_in @user
      redirect_to root_path
    end
  end


#   headers = {"Authorization": "bearer #{token_here}", "User-Agent": "RedditWebDashboard/0.1 by Emilio Corpus"}
#   response = requests.get("https://oauth.reddit.com/api/v1/me", headers=headers)


end
