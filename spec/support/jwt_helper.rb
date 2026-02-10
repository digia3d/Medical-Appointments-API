module JwtHelper
  def jwt_token_for(user)
    JWT.encode(
      { user_id: user.id },
      Rails.application.secrets.secret_key_base
    )
  end
end
