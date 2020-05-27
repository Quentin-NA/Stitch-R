class GmailConnexion
  attr_reader :user, :gmail

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
    @gmail = Google::Apis::GmailV1::GmailService.new
    @gmail.authorization = secrets.to_authorization
  end

  def list_user_label
    @gmail.list_user_labels @user.uid
  end

end
