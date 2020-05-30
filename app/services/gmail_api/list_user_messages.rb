# https://developers.google.com/gmail/api/v1/reference/users/messages/list
# https://www.rubydoc.info/gems/google-api-client/0.9.23/Google/Apis/GmailV1/GmailService#list_user_messages-instance_method

require 'google/apis/gmail_v1'
require 'google/api_client/client_secrets.rb'

class GmailApi::ListUserMessages #< GmailApi::Connexion

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
    signet.refresh! #if signet.expired? # refresh Signet::OAuth2::Client token
    @gmail.authorization = signet
  end

  def call(query)
    # TO DO => gérer la pagination + récupérer resultSizeEstimate
    @response = @gmail.list_user_messages(@user.uid, q: query)
    @response.messages
  end

    # Raw msg decode test Fabien:
    # @response = @gmail.list_user_messages(@user.uid, q: query)
    # @response.messages.map do |m|
    #   @gmail.get_user_message(‘me’,m.id)
    # end
    # msgcode64 = @gmail.get_user_message(‘me’,‘14525ef32beac5de’).payload.parts[0].body.data
    # msgdecode64 = Base64.decode64(msgcode64)
    # raise
end
