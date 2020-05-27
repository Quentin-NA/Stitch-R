require 'google/apis/gmail_v1'
require 'google/api_client/client_secrets.rb'

class GmailApi::Connexion
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
end
