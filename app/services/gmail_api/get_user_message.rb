# https://developers.google.com/gmail/api/v1/reference/users/messages/get
class GmailApi::GetUserMessage < GmailApi::Connexion
  attr_reader :message_id

  def initialize(user, message_id)
    super(user)
    @message_id = message_id
  end

  def call
    @gmail.get_user_message(@user.uid, @message_id)
  end
end
