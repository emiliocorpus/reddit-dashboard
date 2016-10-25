class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def reddit
    @user = User.from_omniauth(request.env["omniauth.auth"])
    binding.pry
    if @user
      # sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      # set_flash_message(:notice, :success, :kind => "Reddit") if is_navigational_format?
      binding.pry
      redirect_to root_path
    end
  end
end
