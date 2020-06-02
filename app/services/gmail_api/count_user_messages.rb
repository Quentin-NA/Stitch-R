# https://developers.google.com/gmail/api/v1/reference/users/messages/list
# https://www.rubydoc.info/gems/google-api-client/0.9.23/Google/Apis/GmailV1/GmailService#list_user_messages-instance_method
class GmailApi::CountUserMessages < GmailApi::Connexion
  def call(query)
    # TO DO => gérer la pagination + récupérer resultSizeEstimate
    @response = @gmail.list_user_messages(@user.uid, q: query)
    @response.resultSizeEstimate
  end
end
