class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: [:developer, :rails_oidc_provider]

  def developer
    sign_in_and_redirect user_from_omniauth
  end

  def rails_oidc_provider
    sign_in_and_redirect user_from_omniauth
  end

  private

    def user_from_omniauth
      User.from_omniauth(request.env["omniauth.auth"])
    end

    def after_omniauth_failure_path_for(scope)
      new_user_session_path(scope)
    end
end
