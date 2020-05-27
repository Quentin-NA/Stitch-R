class GmailApi::GetUserMessage < GmailApi::Connexion
  attr_reader :message_id

  def initialize(user, message_id)
    super
    @message_id = message_id
  end

  def call
    @gmail.get_user_message(@user.uid, @message_id)
  end
end
