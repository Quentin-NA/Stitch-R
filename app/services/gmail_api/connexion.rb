require 'google/apis/gmail_v1'
require 'google/api_client/client_secrets.rb'

# https://www.rubydoc.info/gems/google-api-client/0.9.23/Google/Apis/GmailV1/GmailService
class GmailApi::Connexion
  def initialize(user)
    @user = user
    secrets = Google::APIClient::ClientSecrets.new(
      {
        "web" =>
          {
            "access_token" => user.token,
            # "token_expiry" => user.token_expiry,
            "refresh_token" => user.refresh_token,
            "client_id" => ENV['GOOGLE_ID'],
            "client_secret" => ENV['GOOGLE_SECRET'],
          }
      }
    )
    @gmail = Google::Apis::GmailV1::GmailService.new
    signet = secrets.to_authorization # return a Signet::OAuth2::Client object
    signet.refresh! if signet.expired? # refresh Signet::OAuth2::Client token
    @gmail.authorization = signet
  end
end
