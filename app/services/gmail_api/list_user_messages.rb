class GmailApi::ListUserMessages < GmailApi::Connexion
  def call
    @gmail.list_user_messages(@user.uid).messages
  end
end
