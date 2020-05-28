# https://developers.google.com/gmail/api/v1/reference/users/labels/list

class GmailApi::ListUserLabels < GmailApi::Connexion
  def call
    @gmail.list_user_labels(@user.uid)
  end
end
