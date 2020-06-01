# https://developers.google.com/gmail/api/v1/reference/users/messages/get
class GmailApi::GetUserMessage < GmailApi::Connexion
  attr_reader :message_id

  def initialize(user, message_id)
    super(user)
    @message_id = message_id
  end

  def call (args = {})
    @gmail.get_user_message(@user.uid, @message_id, args)
  end
end

# GmailApi::GetUserMessage.new(User.first, id).call(format: 'metadata', metadata_headers : '...')
# @from = GmailApi::GetUserMessage.new(User.first,"17219de3308e42b4").call(format: 'metadata', metadata_headers : 'From')
