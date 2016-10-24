class CallbacksController < Devise::OmniauthCallbacksController
  def reddit
    binding.pry
    @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
  end
end
