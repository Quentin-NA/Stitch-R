class GmailApi::ListUserLabels < GmailApi::Connexion
  def call
    @gmail.list_user_labels(@user.uid)
  end
end
