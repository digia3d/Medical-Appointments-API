module JwtHelper
  def jwt_token_for_user(user)
    JWT.encode(
      { user_id: user.id },
      Rails.application.secrets.secret_key_base
    )
  end

  def auth_headers(user)
    { 'Authorization' => "Bearer #{jwt_token_for_user(user)}" }
  end
end
