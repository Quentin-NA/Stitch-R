require 'google/apis/gmail_v1'
require 'google/api_client/client_secrets.rb'

class GmailApi::GetUserMessageHeaders

  def initialize(user, email_id, metadatas)
    @user = user
    @message_id = email_id
    @metadatas = metadatas
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
    signet = secrets.to_authorization # return a Signet::OAuth2::Client object
    signet.refresh! # refresh Signet::OAuth2::Client token
    @gmail.authorization = signet
  end

  def call
    @gmail.get_user_message(@user.uid, @message_id, format: "metadata", metadata_headers: @metadatas).payload.headers
  end
end

# Validate in console: GmailApi::GetUserMessageHeaders.new(params).call.payload.headers
# Returns an array of header objects with @name=(eg"From") @value=(Reçu uber <guber.france@uber.com>) attributes
# Depending on number of headers, values can be called = response.first.value

  # def call
  #   @message = @gmail.get_user_message(@user.uid, @message_id, format: "metadata", metadata_headers: @metadatas)
  #   @headers = @message.payload.headers
  #   @header_content = []
  #   @headers.each do |header|
  #     @label = header.name
  #     @content = header.value
  #     @header_content << @content #"{#{@label}"=>" + #{@content}}"
  #   end
  # end
