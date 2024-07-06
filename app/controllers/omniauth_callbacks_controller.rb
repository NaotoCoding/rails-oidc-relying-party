class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def developer
    user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect user
  end
end
