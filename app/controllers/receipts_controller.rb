class ReceiptsController < ApplicationController

require 'signet/oauth_2/client'

  def index
    @receipts = policy_scope(Receipt)
    @client = client
    show_label
  end

  private

  def client
    Signet::OAuth2::Client.new(
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      client_id: ENV["GOOGLE_ID"],
      client_secret: ENV["GOOGLE_SECRET"],
      scope: Google::Apis::GmailV1::AUTH_GMAIL_READONLY,
    )
    redirect_to(client.authorization_uri)
    client.code = request.query['code']
    client.fetch_access_token!
  end

  # def api
  #   service = Google::Apis::GmailV1::GmailService.new
  #   service.client_options.application_name = "Stitch-R"
  #   service.authorization = client
  # end

  # Show the user's labels
  def show_label
    service = Google::Apis::GmailV1::GmailService.new
    service.client_options.application_name = "Stitch-R"
    service.authorization = client
    user_id = "me"
    result = service.list_user_labels user_id
    puts "Labels:"
    puts "No labels found" if result.labels.empty?
    result.labels.each { |label| puts "- #{label.name}" }
  end

end
