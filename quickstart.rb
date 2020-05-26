require "google/apis/gmail_v1"
require "googleauth"
require "googleauth/stores/file_token_store"
require "fileutils"

OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
APPLICATION_NAME = "Gmail API Ruby Quickstart".freeze
CREDENTIALS_PATH = "credentials.json".freeze
# The file token.yaml stores the user's access and refresh tokens, and is
# created automatically when the authorization flow completes for the first
# time.
TOKEN_PATH = "token.yaml".freeze
SCOPE = Google::Apis::GmailV1::AUTH_GMAIL_READONLY

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
# config.omniauth :google_oauth2, ENV["GOOGLE_ID"], ENV["GOOGLE_SECRET"],
#     scope: 'email, profile',
#     info_fields: 'email, first_name, last_name',
#     image_size: 'square',  # 50x50, guaranteed ratio
#     secure_image_url: true
# {
#   "access_token": "ya29.a0AfH6SMCoHCP03SHuNj3vhWBKyjUqNMM8HSDWuXvP8Z89Phj-pIPYk4W6mjA896nVM2AxhyaZlYZ_ILYiEibowAbCef-8Kz4zFmq91pvnY3mPA2G1gb2R_REs9Bjju7vZokmvpsvhxVft7uEocd-dd5w3zgoKKNbRfMU",
#   "scope": "https://www.googleapis.com/auth/gmail.readonly",
#   "token_type": "Bearer",
#   "expires_in": 3599,
#   "refresh_token": "1//04abzD-iV9-x0CgYIARAAGAQSNgF-L9IrAo2GiOOUfebG9pule4DrRpuBEIKql2Zy7kuFwXfEkkCv-L8tFTr-b5ZZTf7Sqj1Huw"
# }
# CREDENTIALS_PATH = File.join(Dir.pwd, '.credentials',"gmail-api-credentials.json")
# def self.find_for_google_oauth(auth)
#     user_params = auth.slice("provider", "uid")
#     user_params.merge! auth.info.slice("email", "first_name", "last_name")
#     user_params[:google_picture_url] = auth.info.image
#     user_params[:token] = auth.credentials.token
#     user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
#     user_params = user_params.to_h

#     user = User.find_by(provider: auth.provider, uid: auth.uid)
#     user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
#     if user
#       user.update(user_params)
#     else
#       user = User.new(user_params)
#       user.password = Devise.friendly_token[0,20]  # Fake password for validation
#       user.save
#     end

#     return user
#   end

# def client(scopes = [Google::Apis::GmailV1::AUTH_GMAIL_READONLY])
#     Signet::OAuth2::Client.new(
#       authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
#       token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
#       client_id: ENV["GOOGLE_ID"],
#       client_secret: ENV["GOOGLE_SECRET"],
#       access_token: current_user.token,
#       refresh_token: current_user.token_expires,
#       scope: Google::Apis::GmailV1::AUTH_GMAIL_READONLY,
#     )
# end



def authorize
    client_id = ENV["GOOGLE_ID"]
    token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
    authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store

    user_id = "default"
    credentials = authorizer.get_credentials user_id
   if credentials.nil?
     url = authorizer.get_authorization_url base_url: OOB_URI
     puts "Open the following URL in the browser and enter the " \
          "resulting code after authorization:\n" + url
     code = gets
     credentials = authorizer.get_and_store_credentials_from_code(
       user_id: user_id, code: code, base_url: OOB_URI
     )
   end
   credentials
 end

# Initialize the API
service = Google::Apis::GmailV1::GmailService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

# Show the user's labels
user_id = "me"
result = service.list_user_labels user_id
puts "Labels:"
puts "No labels found" if result.labels.empty?
result.labels.each { |label| puts "- #{label.name}" }
