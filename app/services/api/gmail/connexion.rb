class Api::Gmail::Connexion
  def initialize(user)
    @user = user
    secrets = Google::APIClient::ClientSecrets.new(
      {
        "web" =>
          {
            "access_token" => user.token,
            "refresh_token" => user.refresh_token,
            "client_id" => ENV['GOOGLE_ID'],
            "client_secret" => ENV['GOOGLE_SECRET'],
          }
      }
    )
    @gmail = Gmail::GmailService.new
    @gmail.authorization = secrets.to_authorization
  end
end
