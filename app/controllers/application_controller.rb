# require 'google/apis/people_v1'
require 'google/apis/gmail_v1'
require 'google/api_client/client_secrets.rb'

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include Pundit
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  # # Google Api #
  #   # People = Google::Apis::PeopleV1
  #   Gmail = Google::Apis::GmailV1

  #   def contacts
  #     secrets = Google::APIClient::ClientSecrets.new(
  #       {
  #         "web" =>
  #           {
  #             "access_token" => current_user.token,
  #             "refresh_token" => current_user.refresh_token,
  #             "client_id" => ENV['GOOGLE_ID'],
  #             "client_secret" => ENV['GOOGLE_SECRET'],
  #           }
  #       }
  #     )
  #     service = Gmail::GmailService.new
  #     service.authorization = secrets.to_authorization
  #     response = service.list_person_connections(
  #       'people/me',
  #        person_fields: ['names', 'emailAddresses', 'phoneNumbers']
  #     )
  #     render json: response
  #   end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)|(^omni$)/
  end
end
